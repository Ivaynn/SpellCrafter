#> as player, at barrel (player id matches table id)
# storage "isc:tmp items" must contain barrel items


# Check if player is holding wand
execute unless predicate isc:holding_wand run return 0


# Check if the held wand is empty
execute if data entity @s SelectedItem.components."minecraft:custom_data".isc.wand.spells[0] run return 0


# Reset scores & storages
scoreboard players set $mana isc.tmp 0
scoreboard players set $cooldown isc.tmp 0
scoreboard players set $spell.sharp isc.tmp 0
data modify storage isc:tmp wand set value {valid:1b, spells:[], slots:[]}
data modify storage isc:tmp lore set value []
data modify storage isc:tmp drop set value []
data modify storage isc:tmp wand.mod set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand.mod


# Iterate through all the items & save spell data to storages "isc:tmp wand" and "isc:tmp lore"
execute store result score $iter isc.tmp run data get storage isc:tmp items
scoreboard players set $clone_multiplier isc.tmp 1
function isc:as_table/close/for_item


# Drop non-spell items
execute if data storage isc:tmp drop[0] run function isc:as_table/close/drop_extra


# If no spells, clear wand
execute unless data storage isc:tmp wand.spells[0] run return run function isc:as_table/close/empty


# Special cases
execute if score $spell.sharp isc.tmp matches 1.. run item modify entity @s weapon isc:wand/sharp


# Save mana cost & cooldown to wand object
execute unless score $mana isc.tmp matches 0.. run scoreboard players set $mana isc.tmp 0
execute unless score $cooldown isc.tmp matches 0.. run scoreboard players set $cooldown isc.tmp 0
execute store result storage isc:tmp wand.mana int 1 run scoreboard players get $mana isc.tmp
execute store result storage isc:tmp wand.cooldown int 1 run scoreboard players get $cooldown isc.tmp


# Create storage with the cooldown in seconds format for the lore
function isc:as_table/close/cooldown_sec


# Update wand with data from storage
item modify entity @s weapon isc:wand/update
item modify entity @s weapon isc:wand/lore/stats


# Add spells to item lore
execute store result score $iter isc.tmp run data get storage isc:tmp lore
function isc:as_table/close/for_lore


# Wand modifiers
item modify entity @s weapon isc:wand/lore/wand_mod


# Success
return 1
