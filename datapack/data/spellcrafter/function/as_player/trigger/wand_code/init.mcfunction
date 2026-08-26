
# Cancel if this isn't a wand
execute unless predicate spellcrafter:holding_wand run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.valid run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]


# Get data
data modify storage spellcrafter:tmp trigger.code set value {}
data modify storage spellcrafter:tmp trigger.code.wand set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand


# WIP
tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Not Implemented",color:"gray"}]
