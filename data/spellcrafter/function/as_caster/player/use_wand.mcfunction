#> as player, at @s


# Get caster ID
execute unless score @s spellcrafter.id matches 1.. run function spellcrafter:as_caster/new_id


# If caster is on cooldown, stop here
execute if score @s spellcrafter.cooldown matches 1.. run return 0


# Cooldown
execute store result score @s spellcrafter.cooldown run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players operation @s spellcrafter.cooldown > min_cooldown spellcrafter.options
execute unless score @s spellcrafter.cooldown matches 1.. run scoreboard players set @s spellcrafter.cooldown 0


# Cancel if the selected item isn't a wand
execute unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter run return 0


# Cancel if the selected wand doesn't have spells (or wand modifiers)
execute unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.spells[0] unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.mod run return run playsound minecraft:entity.item.break player @s ~ ~ ~ 0.5 2


# Get spell data from selected item
data modify storage spellcrafter:tmp wand set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand
execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp wand.mana


# Prevent players cast above the mana limit
execute if score $mana spellcrafter.tmp matches 2147483647 if score @s spellcrafter.mana matches 2147483647 run scoreboard players set @s spellcrafter.mana 0


# Spend mana | cancel if player doesn't have enough mana
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run scoreboard players set @s spellcrafter.cooldown 4
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run playsound minecraft:entity.item.break player @a ~ ~ ~ 0.5 2
execute if score @s spellcrafter.mana < $mana spellcrafter.tmp run return 0
scoreboard players operation @s spellcrafter.mana -= $mana spellcrafter.tmp


# Create a projectile with the spell data
scoreboard players set $new_cast spellcrafter.tmp 1
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $clone_count spellcrafter.tmp = @s spellcrafter.clone
data modify storage spellcrafter:tmp rotation set from entity @s Rotation
scoreboard players set $spell.multicast spellcrafter.tmp 0

execute anchored eyes positioned ^ ^ ^0.4 summon minecraft:marker run function spellcrafter:as_projectile/summon


# Clear
scoreboard players set $new_cast spellcrafter.tmp 0
