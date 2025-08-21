#> as player, at barrel (player id matches table id)
# storage "spellcrafter:tmp items" must contain barrel items


# Check if player is holding wand
execute unless predicate spellcrafter:holding_wand run return 0


# Check if the held wand is empty
execute if data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.spells[0] run return 0


# Reset scores & storages
scoreboard players set $mana spellcrafter.tmp 0
scoreboard players set $cooldown spellcrafter.tmp 0
scoreboard players set $table.warning spellcrafter.tmp 0
data modify storage spellcrafter:tmp wand set value {valid:1b, version:0, spells:[], slots:[], owner:0, mod:0, cap:0, cooldown:0, mana:0, base_cooldown:0, base_mana:0, skin:0}
data modify storage spellcrafter:tmp lore set value []
data modify storage spellcrafter:tmp drop set value []
data modify storage spellcrafter:tmp keep set value []
execute store result storage spellcrafter:tmp wand.version int 1 run scoreboard players get #version spellcrafter.options
data modify storage spellcrafter:tmp wand.mod set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.mod
data modify storage spellcrafter:tmp wand.cap set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.cap
data modify storage spellcrafter:tmp wand.base_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.base_cooldown
data modify storage spellcrafter:tmp wand.base_mana set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.base_mana
execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_mana
execute store result score $cooldown spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_cooldown


# Counters for stackable specials that are applied at the end
scoreboard players set $spell.sharp spellcrafter.tmp 0
scoreboard players set $spell.extended spellcrafter.tmp 0
scoreboard players set $spell.quickstep spellcrafter.tmp 0
scoreboard players set $spell.secret spellcrafter.tmp 0
scoreboard players set $spell.locked spellcrafter.tmp 0
scoreboard players set $spell.skip spellcrafter.tmp 0


# Separate items in storages "spellcrafter:tmp keep" and "spellcrafter:tmp drop"
execute store result score $spell_cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap
execute store result score $iter spellcrafter.tmp run data get storage spellcrafter:tmp items
function spellcrafter:as_table/close/for_item


# Drop non-spells
execute if data storage spellcrafter:tmp drop[0] run function spellcrafter:as_table/close/drop_extra


# If no spells, clear wand
execute unless data storage spellcrafter:tmp keep[0] run return run function spellcrafter:as_table/close/empty


# Iterate through all the spells & save spell data to storages "spellcrafter:tmp wand" and "spellcrafter:tmp lore"
execute store result score $iter spellcrafter.tmp run data get storage spellcrafter:tmp keep
scoreboard players set $clone_multiplier spellcrafter.tmp 1
function spellcrafter:as_table/close/for_spell


# Special case: attribute spells -> calculate and save mana drain
scoreboard players set $attribute_drain spellcrafter.tmp 0
scoreboard players operation $attribute_drain spellcrafter.tmp += $spell.sharp spellcrafter.tmp
scoreboard players operation $attribute_drain spellcrafter.tmp += $spell.extended spellcrafter.tmp
scoreboard players operation $attribute_drain spellcrafter.tmp += $spell.quickstep spellcrafter.tmp
scoreboard players operation $attribute_drain spellcrafter.tmp *= #40 spellcrafter.math

execute store result storage spellcrafter:tmp wand.drain int 1 run scoreboard players get $attribute_drain spellcrafter.tmp
execute if score $attribute_drain spellcrafter.tmp matches 1.. run item modify entity @s weapon spellcrafter:wand/set_attributes


# Special case: locked -> store owner id
execute if score $spell.locked spellcrafter.tmp matches 1 store result storage spellcrafter:tmp wand.owner int 1 run scoreboard players get @s spellcrafter.id


# If no spells, clear wand
execute unless data storage spellcrafter:tmp wand.spells[0] run return run function spellcrafter:as_table/close/empty


# Save mana cost & cooldown to wand object
execute unless score $mana spellcrafter.tmp matches 0.. run scoreboard players set $mana spellcrafter.tmp 0
execute unless score $cooldown spellcrafter.tmp matches 0.. run scoreboard players set $cooldown spellcrafter.tmp 0
execute store result storage spellcrafter:tmp wand.mana int 1 run scoreboard players get $mana spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.cooldown int 1 run scoreboard players get $cooldown spellcrafter.tmp


# Create storage with the cooldown in seconds format for the lore
function spellcrafter:as_table/close/cooldown_sec


# Update wand with data from storage
execute store result score $spell_count spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells
execute store result score $spell_cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap
item modify entity @s weapon spellcrafter:wand/update
item modify entity @s weapon spellcrafter:wand/lore/stats


# Add spells to item lore
execute store result score $iter spellcrafter.tmp run data get storage spellcrafter:tmp lore
function spellcrafter:as_table/close/for_lore


# Wand modifier
item modify entity @s weapon spellcrafter:wand/lore/wand_mod_add


# Prevent cooldown reset abuse
execute unless score @s spellcrafter.cooldown matches 4.. run scoreboard players set @s spellcrafter.cooldown 4


# Warning
execute if score $table.warning spellcrafter.tmp matches 1 run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"This wand is full! Extra spells have been dropped.",color:"gray"}]


# Success
return 1
