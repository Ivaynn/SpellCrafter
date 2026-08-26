#> as player


# Cancel if this isn't a wand
execute unless predicate spellcrafter:holding_wand run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.valid run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]


# Get data
data modify storage spellcrafter:tmp trigger.code set value {characters: [], wand: {}, string: ""}
data modify storage spellcrafter:tmp trigger.code.wand set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand


# Schema version: must be 1 for now - use this field to support future schema changes
scoreboard players set $value spellcrafter.tmp 1
function spellcrafter:as_player/trigger/wand_code/append_one


# Serialize wand data
execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.base_mana
function spellcrafter:as_player/trigger/wand_code/append_two

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.base_cooldown
function spellcrafter:as_player/trigger/wand_code/append_two

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.cap
function spellcrafter:as_player/trigger/wand_code/append_one

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.skin
function spellcrafter:as_player/trigger/wand_code/append_two

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.mod
function spellcrafter:as_player/trigger/wand_code/append_two

scoreboard players set $slot spellcrafter.tmp 0
function spellcrafter:as_player/trigger/wand_code/for_spell


# Show wand code
tellraw @s ["",{text:"> ",color:"#965ed6", bold:true},{text:"Your wand code:",color:"gray"},"\n",{storage:"spellcrafter:tmp",nbt:"trigger.code.characters",interpret:true}]
# TODO: click to copy to clipboard
