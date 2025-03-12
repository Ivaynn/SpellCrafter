#> as caster, at @s


# Validate entity as a caster
execute as @s[tag=!spellcrafter.caster] run return 0
execute unless score @s spellcrafter.id matches 1.. run function spellcrafter:as_caster/new_id


# Get held wand item
data modify storage spellcrafter:tmp mainhand set value {}
execute as @s[type=minecraft:player] run data modify storage spellcrafter:tmp mainhand set from entity @s SelectedItem
execute as @s[type=!minecraft:player] run data modify storage spellcrafter:tmp mainhand set from entity @s HandItems[0]


# Cancel if item isn't a wand
execute unless data storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter run return 0


# Cancel if the wand doesn't have spells
execute unless data storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.spells[0] run return run playsound minecraft:entity.item.break player @s ~ ~ ~ 0.5 2


# Handle cooldown
execute if score @s spellcrafter.cooldown matches 1.. run return 0
execute store result score @s spellcrafter.cooldown run data get storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players operation @s spellcrafter.cooldown > min_cooldown spellcrafter.options
execute unless score @s spellcrafter.cooldown matches 1.. run scoreboard players set @s spellcrafter.cooldown 0


# Spend mana or cancel if caster doesn't have enough mana
execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.mana
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run scoreboard players set @s spellcrafter.cooldown 20
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run playsound minecraft:entity.item.break player @a ~ ~ ~ 0.5 2
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run return 0
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
