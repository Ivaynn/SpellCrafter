#> as non-player caster, at @s


# Get caster ID
execute unless score @s isc.id matches 1.. run function isc:as_caster/new_id


# Cooldown
scoreboard players set @s isc.cooldown 100


# Cancel if the selected item isn't a usable wand
execute unless data entity @s HandItems[0].tag.isc.wand.spells[0] run return 0


# Get spell data from selected item
data modify storage isc:tmp wand set from entity @s HandItems[0].tag.isc.wand
execute store result score $mana isc.tmp run data get storage isc:tmp wand.mana


# Spend mana | cancel if player doesn't have enough mana
execute if score @s isc.mana < $mana isc.tmp run return 0
scoreboard players operation @s isc.mana -= $mana isc.tmp


# Create a projectile with the spell data
scoreboard players set $new_cast isc.tmp 1
scoreboard players operation $id isc.tmp = @s isc.id
data modify storage isc:tmp copy.rotation set from entity @s Rotation

execute anchored eyes positioned ^ ^ ^0.4 summon minecraft:marker run function isc:as_projectile/summon


# Clear
scoreboard players set $new_cast isc.tmp 0
