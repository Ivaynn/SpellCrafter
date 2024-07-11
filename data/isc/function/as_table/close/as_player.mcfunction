#> as player, at barrel (player id matches table id)
# storage "isc:tmp items" must contain barrel items


# Check if player is holding wand
execute unless predicate isc:holding_wand run return 0


# Check if the held wand is empty
execute if data entity @s SelectedItem.components."minecraft:custom_data".isc.wand.spells[0] run return 0


# Reset scores & storages
scoreboard players set $mana isc.tmp 0
scoreboard players set $cooldown isc.tmp 0
data modify storage isc:tmp wand set value {valid:1b, spells:[], slots:[], owner:0, mod:0, cap:0, cooldown:0, mana:0, base_cooldown:0, base_mana:0}
data modify storage isc:tmp lore set value []
data modify storage isc:tmp drop set value []
data modify storage isc:tmp keep set value []
data modify storage isc:tmp wand.mod set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand.mod
data modify storage isc:tmp wand.cap set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand.cap
data modify storage isc:tmp wand.base_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand.base_cooldown
data modify storage isc:tmp wand.base_mana set from entity @s SelectedItem.components."minecraft:custom_data".isc.wand.base_mana
execute store result score $mana isc.tmp run data get storage isc:tmp wand.base_mana
execute store result score $cooldown isc.tmp run data get storage isc:tmp wand.base_cooldown


# Special spells that modify the wand item
scoreboard players set $spell.sharp isc.tmp 0
scoreboard players set $spell.extended isc.tmp 0
scoreboard players set $spell.quickstep isc.tmp 0
scoreboard players set $spell.secret isc.tmp 0
scoreboard players set $spell.locked isc.tmp 0
scoreboard players set $spell.skip isc.tmp 0


# Separate items in storages "isc:tmp keep" and "isc:tmp drop"
execute store result score $spell_cap isc.tmp run data get storage isc:tmp wand.cap
execute store result score $iter isc.tmp run data get storage isc:tmp items
function isc:as_table/close/for_item


# Drop non-spells
execute if data storage isc:tmp drop[0] run function isc:as_table/close/drop_extra


# If no spells, clear wand
execute unless data storage isc:tmp keep[0] run return run function isc:as_table/close/empty


# Iterate through all the spells & save spell data to storages "isc:tmp wand" and "isc:tmp lore"
execute store result score $iter isc.tmp run data get storage isc:tmp keep
scoreboard players set $clone_multiplier isc.tmp 1
function isc:as_table/close/for_spell


# Special cases
scoreboard players set $set_attributes isc.tmp 0
execute if score $spell.sharp isc.tmp matches 1.. run scoreboard players set $set_attributes isc.tmp 1 
execute if score $spell.extended isc.tmp matches 1.. run scoreboard players set $set_attributes isc.tmp 1 
execute if score $spell.quickstep isc.tmp matches 1.. run scoreboard players set $set_attributes isc.tmp 1 
execute if score $set_attributes isc.tmp matches 1 run item modify entity @s weapon isc:wand/set_attributes

execute if score $spell.locked isc.tmp matches 1 store result storage isc:tmp wand.owner int 1 run scoreboard players get @s isc.id


# Save mana cost & cooldown to wand object
execute unless score $mana isc.tmp matches 0.. run scoreboard players set $mana isc.tmp 0
execute unless score $cooldown isc.tmp matches 0.. run scoreboard players set $cooldown isc.tmp 0
execute store result storage isc:tmp wand.mana int 1 run scoreboard players get $mana isc.tmp
execute store result storage isc:tmp wand.cooldown int 1 run scoreboard players get $cooldown isc.tmp


# Create storage with the cooldown in seconds format for the lore
function isc:as_table/close/cooldown_sec


# Update wand with data from storage
execute store result score $spell_count isc.tmp run data get storage isc:tmp wand.spells
execute store result score $spell_cap isc.tmp run data get storage isc:tmp wand.cap
item modify entity @s weapon isc:wand/update
item modify entity @s weapon isc:wand/lore/stats


# Add spells to item lore
execute store result score $iter isc.tmp run data get storage isc:tmp lore
function isc:as_table/close/for_lore


# Wand modifiers
item modify entity @s weapon isc:wand/lore/wand_mod


# Success
return 1
