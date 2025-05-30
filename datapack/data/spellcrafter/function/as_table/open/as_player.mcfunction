#> as player, at barrel (player id matches table id)


# Check if player is holding wand
execute unless predicate spellcrafter:holding_wand run return 0


# Locked wand
execute store result score $owner spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.owner
execute if score $owner spellcrafter.tmp matches 1.. unless score @s spellcrafter.id = $owner spellcrafter.tmp run return run tellraw @s ["",{text:"> ",color:"red",bold:true},{text:"This wand is locked!",color:"gray"}]


# Put wand information on storage & clear wand
data remove storage spellcrafter:tmp wand
data modify storage spellcrafter:tmp wand set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand
function spellcrafter:as_table/close/empty
scoreboard players set $success spellcrafter.tmp 1
