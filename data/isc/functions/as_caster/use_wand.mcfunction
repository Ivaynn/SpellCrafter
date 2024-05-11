#> as player, at @s


# Get caster ID
execute unless score @s isc.id matches 1.. run function isc:as_caster/new_id


# Cooldown
execute store result score @s isc.cooldown run data get entity @s SelectedItem.components."minecraft:custom_data".isc.wand.cooldown
scoreboard players operation @s isc.cooldown > min_cooldown isc.options
execute unless score @s isc.cooldown matches 1.. run scoreboard players set @s isc.cooldown 0


# Cancel if the selected item isn't a wand
execute unless data entity @s SelectedItem.components."minecraft:custom_data".isc run return 0


# Cancel if the selected wand doesn't have spells
execute unless data entity @s SelectedItem.components."minecraft:custom_data".isc.wand.spells[0] run return run playsound minecraft:entity.item.break player @s ~ ~ ~ 0.5 2


# Get spell data from selected item
data modify storage isc:tmp wand set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand
execute store result score $mana isc.tmp run data get storage isc:tmp wand.mana


# Spend mana | cancel if player doesn't have enough mana
execute if score @s isc.mana < $mana isc.tmp run scoreboard players set @s isc.cooldown 4
execute if score @s isc.mana < $mana isc.tmp run playsound minecraft:entity.item.break player @a ~ ~ ~ 0.5 2
execute if score @s isc.mana < $mana isc.tmp run return 0
scoreboard players operation @s isc.mana -= $mana isc.tmp


# Create a projectile with the spell data
scoreboard players set $new_cast isc.tmp 1
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $clone_count isc.tmp = @s isc.clone
data modify storage isc:tmp rotation set from entity @s Rotation

execute anchored eyes positioned ^ ^ ^0.4 summon minecraft:marker run function isc:as_projectile/summon


# Clear
scoreboard players set $new_cast isc.tmp 0
