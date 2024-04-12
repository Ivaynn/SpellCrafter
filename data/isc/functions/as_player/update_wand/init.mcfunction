
# If the player isn't holding a "wand", return early
execute unless data entity @s {SelectedItem:{id:"minecraft:carrot_on_a_stick"}} run return fail


# Reset
scoreboard players set $mana isc.tmp 0
data remove storage isc:tmp id
data remove storage isc:tmp wand
data modify storage isc:tmp lore set value ['{"text":""}','{"text":""}']


# Get items (TODO: improve this)
data modify storage isc:tmp wand.items set from block 0 0 0 Items


# Create spell list from items
execute store result score $iter isc.tmp run data get storage isc:tmp wand.items
function isc:as_player/update_wand/for_item


# Remove item data
data remove storage isc:tmp wand.items


# Save mana cost
execute store result storage isc:tmp wand.mana int 1 run scoreboard players get $mana isc.tmp
summon minecraft:text_display ~ ~ ~ {Tags:["isc.tmp"], text:'{"text":""}',alignment:"center"}
execute as @e[distance=..0.01,type=minecraft:text_display,tag=isc.tmp] run function isc:as_player/update_wand/summon_text


# Update wand with data from storage
item modify entity @s weapon isc:update_wand
