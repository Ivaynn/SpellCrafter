#> as player, at barrel (player id matches table id)


# Check if player is holding wand
execute unless predicate isc:holding_wand run return 0


# Put wand information on storage & clear wand
data remove storage isc:tmp wand
data modify storage isc:tmp wand set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand
item modify entity @s weapon isc:wand/empty
item modify entity @s weapon isc:wand/lore/wand_mod
return 1
