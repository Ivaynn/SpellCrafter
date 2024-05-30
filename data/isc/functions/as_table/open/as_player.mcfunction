#> as player, at barrel (player id matches table id)


# Check if player is holding wand
execute unless predicate isc:holding_wand run return 0


# Locked wand
execute store result score $owner isc.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".isc.wand.owner
execute if score $owner isc.tmp matches 1.. unless score @s isc.id = $owner isc.tmp run return run tellraw @s ["",{"text":"<SpellCrafter> ","color":"dark_aqua"},{"text":"This wand is locked!","color":"gray"}]


# Put wand information on storage & clear wand
data remove storage isc:tmp wand
data modify storage isc:tmp wand set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand
item modify entity @s weapon isc:wand/empty
item modify entity @s weapon isc:wand/lore/wand_mod
scoreboard players set $success isc.tmp 1
