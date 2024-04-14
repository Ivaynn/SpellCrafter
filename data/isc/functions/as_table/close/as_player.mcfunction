#> as player, at barrel (player id matches table id)
# storage "isc:tmp items" must contain barrel items


# Check if player is holding wand
execute unless predicate isc:holding_wand run return 0


# Check if the held wand is empty
execute if data entity @s SelectedItem.tag.isc.wand.spells[0] run return 0


# Reset scores & storages
scoreboard players set $mana isc.tmp 0
data modify storage isc:tmp wand set value {valid:1b, spells:[]}
data modify storage isc:tmp lore set value ['{"text":""}','{"text":""}']
data modify storage isc:tmp drop set value []


# Iterate through all the items & save spell data to storages "isc:tmp wand" and "isc:tmp lore"
execute store result score $iter isc.tmp run data get storage isc:tmp items
function isc:as_table/close/for_item


# Save mana cost as json component - can't use "execute summon" because that shows an error in the console
execute store result storage isc:tmp wand.mana int 1 run scoreboard players get $mana isc.tmp
summon minecraft:text_display ~ ~ ~ {Tags:["isc.tmp"], text:'{"text":""}', alignment:"center"}
execute as @e[distance=..0.01,type=minecraft:text_display,tag=isc.tmp] run function isc:as_table/close/summon_text


# Update wand with data from storage
item modify entity @s weapon isc:update_wand


# Drop non-spell items
execute if data storage isc:tmp drop[0] run function isc:as_table/close/drop_extra


# Success
return 1
