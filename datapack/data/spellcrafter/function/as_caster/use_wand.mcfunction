#> as caster, at @s


# Check if entity is alive (the advancement can trigger if the player is dead. yes, really)
tag @s add spellcrafter.tmp
tag @e[type=#spellcrafter:caster,distance=..0.001,tag=spellcrafter.tmp] remove spellcrafter.tmp
execute as @s[tag=spellcrafter.tmp] run return run tag @s remove spellcrafter.tmp


# Validate entity as a caster
execute as @s[type=!#spellcrafter:caster] run return 0
execute as @s[tag=!spellcrafter.caster] run return 0
execute unless score @s spellcrafter.id matches 1.. run function spellcrafter:as_caster/new_id


# Cancel if caster is on priority cooldown
execute if score @s spellcrafter.cooldown matches 1.. run return 0


# Get hand item
data modify storage spellcrafter:tmp mainhand set value {}
execute as @s[type=minecraft:player] run data modify storage spellcrafter:tmp mainhand set from entity @s SelectedItem
execute as @s[type=!minecraft:player] run data modify storage spellcrafter:tmp mainhand set from entity @s equipment.mainhand


# Cancel if item isn't a wand - how was this function called??
execute unless data storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand run return 0


# Cancel if the wand doesn't have spells
execute unless data storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.spells[0] run return run function spellcrafter:as_caster/use_fail


# Handle cooldown
scoreboard players set $cooldown.this spellcrafter.tmp 0
execute as @s[type=minecraft:player] run function spellcrafter:as_caster/player/get_cooldown
execute as @s[type=!minecraft:player] run function spellcrafter:as_caster/nonplayer/get_cooldown
execute if score $cooldown.this spellcrafter.tmp matches 1.. run return run scoreboard players set @s spellcrafter.cooldown 4


# Spend mana or cancel if caster doesn't have enough mana
execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.mana
scoreboard players operation $mana spellcrafter.tmp *= #10 spellcrafter.math
execute unless score $mana spellcrafter.tmp matches 0.. run return run function spellcrafter:as_caster/use_fail
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run return run function spellcrafter:as_caster/use_fail
scoreboard players operation @s spellcrafter.mana -= $mana spellcrafter.tmp


# Create a projectile with the spell data
data modify storage spellcrafter:tmp wand set from storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand
scoreboard players set $new_cast spellcrafter.tmp 1
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $clone_count spellcrafter.tmp = @s spellcrafter.clone
data modify storage spellcrafter:tmp rotation set from entity @s Rotation
scoreboard players set $spell.multicast spellcrafter.tmp 0

execute anchored eyes positioned ^ ^ ^0.4 summon minecraft:marker run function spellcrafter:as_projectile/summon


# Clear
scoreboard players set $new_cast spellcrafter.tmp 0


# Update wand item - save gametime in item data
execute if score $cooldown.this spellcrafter.tmp matches -1 run return 0
execute store result storage spellcrafter:tmp wand.gametime int 1 run scoreboard players get $gametime spellcrafter.tmp
item modify entity @s weapon spellcrafter:wand/init_cooldown
