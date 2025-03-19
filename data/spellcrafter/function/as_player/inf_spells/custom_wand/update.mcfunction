#> as player


# If appearance item is missing, update wand skin
execute unless data entity @s Inventory[{Slot:13b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:11}}}}] run function spellcrafter:as_player/inf_spells/custom_wand/change_skin


# If wand slot is empty, get empty gui items and stop here
execute unless items entity @s inventory.13 #spellcrafter:wand run return run function spellcrafter:as_player/inf_spells/custom_wand/clear_wand


# Get old data from backup item + reset item
data modify storage spellcrafter:tmp inf_save set value {new: {}, old: {}}
data modify storage spellcrafter:tmp inf_save.old set from entity @s Inventory[{Slot:13b}].components."minecraft:custom_data".spellcrafter.inf_save
function spellcrafter:as_player/inf_spells/custom_wand/clear_skin


# Check if wand slot changed
data modify storage spellcrafter:tmp inf_save.new.wand set from entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand
scoreboard players set $inf_change_wand spellcrafter.tmp 0
execute if data storage spellcrafter:tmp inf_save.old.wand unless data storage spellcrafter:tmp inf_save.new.wand run scoreboard players set $inf_change_wand spellcrafter.tmp 1
execute if data storage spellcrafter:tmp inf_save.new.wand unless data storage spellcrafter:tmp inf_save.old.wand run scoreboard players set $inf_change_wand spellcrafter.tmp 1
execute if score $inf_change_wand spellcrafter.tmp matches 0 store result score $inf_change_wand spellcrafter.tmp run data modify storage spellcrafter:tmp inf_save.old.wand set from storage spellcrafter:tmp inf_save.new.wand


# If wand slot changed, get spell item from its modifier data
execute if score $inf_change_wand spellcrafter.tmp matches 1 run function spellcrafter:as_player/inf_spells/custom_wand/get_mod


# Check if mod slot changed
data modify storage spellcrafter:tmp inf_save.new.mod set from entity @s Inventory[{Slot:31b}].components."minecraft:custom_data".spellcrafter.spell.id
scoreboard players set $inf_change_mod spellcrafter.tmp 0
execute if data storage spellcrafter:tmp inf_save.old.mod unless data storage spellcrafter:tmp inf_save.new.mod run scoreboard players set $inf_change_mod spellcrafter.tmp 2
execute if data storage spellcrafter:tmp inf_save.new.mod unless data storage spellcrafter:tmp inf_save.old.mod run scoreboard players set $inf_change_mod spellcrafter.tmp 3
execute if score $inf_change_mod spellcrafter.tmp matches 0 store result score $inf_change_mod spellcrafter.tmp run data modify storage spellcrafter:tmp inf_save.old.mod set from storage spellcrafter:tmp inf_save.new.mod


# Get current wand stats
data remove storage spellcrafter:tmp wand
data modify storage spellcrafter:tmp wand set from entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand

scoreboard players set $mana spellcrafter.tmp 0
scoreboard players set $cooldown spellcrafter.tmp 0
scoreboard players set $base_mana spellcrafter.tmp 0
scoreboard players set $base_cooldown spellcrafter.tmp 0
scoreboard players set $spell_cap spellcrafter.tmp 0
scoreboard players set $spell_count spellcrafter.tmp 0

execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp wand.mana
execute store result score $cooldown spellcrafter.tmp run data get storage spellcrafter:tmp wand.cooldown
execute store result score $base_mana spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_mana
execute store result score $base_cooldown spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_cooldown
execute store result score $spell_cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap

scoreboard players operation $mana spellcrafter.tmp -= $base_mana spellcrafter.tmp
scoreboard players operation $cooldown spellcrafter.tmp -= $base_cooldown spellcrafter.tmp


# Get wand modifier id from the spell item slot + validate
execute if score $inf_change_mod spellcrafter.tmp matches 1.. if score $inf_change_wand spellcrafter.tmp matches 0 run function spellcrafter:as_player/inf_spells/custom_wand/update_mod


# Update stats
execute unless data entity @s Inventory[{Slot:12b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:4}}}}] run scoreboard players remove $spell_cap spellcrafter.tmp 1
execute unless data entity @s Inventory[{Slot:14b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:5}}}}] run scoreboard players add $spell_cap spellcrafter.tmp 1
execute unless data entity @s Inventory[{Slot:21b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:8}}}}] run scoreboard players remove $base_cooldown spellcrafter.tmp 5
execute unless data entity @s Inventory[{Slot:23b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:9}}}}] run scoreboard players add $base_cooldown spellcrafter.tmp 5
execute unless data entity @s Inventory[{Slot:30b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:6}}}}] run scoreboard players remove $base_mana spellcrafter.tmp 5
execute unless data entity @s Inventory[{Slot:32b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:7}}}}] run scoreboard players add $base_mana spellcrafter.tmp 5


# Check stat limits
execute unless score $spell_cap spellcrafter.tmp matches 0.. run scoreboard players set $spell_cap spellcrafter.tmp 0
execute unless score $spell_cap spellcrafter.tmp matches ..27 run scoreboard players set $spell_cap spellcrafter.tmp 27

execute store result score $spell_count spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells
scoreboard players operation $spell_cap spellcrafter.tmp > $spell_count spellcrafter.tmp

execute unless score $base_mana spellcrafter.tmp matches 0.. run scoreboard players set $base_mana spellcrafter.tmp 0
execute unless score $base_cooldown spellcrafter.tmp matches 0.. run scoreboard players set $base_cooldown spellcrafter.tmp 0


# Calculate updated mana and cooldown
scoreboard players operation $mana spellcrafter.tmp += $base_mana spellcrafter.tmp
scoreboard players operation $cooldown spellcrafter.tmp += $base_cooldown spellcrafter.tmp


# Save stats
execute store result storage spellcrafter:tmp wand.cap int 1 run scoreboard players get $spell_cap spellcrafter.tmp

execute store result storage spellcrafter:tmp wand.mana int 1 run scoreboard players get $mana spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.base_mana int 1 run scoreboard players get $base_mana spellcrafter.tmp

execute store result storage spellcrafter:tmp wand.cooldown int 1 run scoreboard players get $cooldown spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.base_cooldown int 1 run scoreboard players get $base_cooldown spellcrafter.tmp


# Create storage with the cooldown in seconds format for the lore
function spellcrafter:as_table/close/cooldown_sec


# Modify wand item
item modify entity @s inventory.13 spellcrafter:wand/update
item modify entity @s inventory.13 spellcrafter:wand/lore/update_stats


# Save new data to backup item to use as old data on the next update
data modify storage spellcrafter:tmp inf_save.new.wand set from storage spellcrafter:tmp wand
item modify entity @s inventory.4 spellcrafter:wand/inf_save
