#> as player


# Cancel if this isn't a wand
execute unless predicate spellcrafter:holding_wand run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.valid run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]


# Get data
data modify storage spellcrafter:tmp trigger.code set value {characters: [], wand: {}, macro:{}, clipboard:{}}
data modify storage spellcrafter:tmp trigger.code.wand set from entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand


# Serialize data
function spellcrafter:as_player/trigger/wand_code/serialize


# Show message
data modify storage spellcrafter:tmp trigger.code.characters insert 32 value "\n"
tellraw @s [{storage:"spellcrafter:tmp",nbt:"trigger.code.clipboard",interpret:true,hover_event:{action:"show_text",value:[{text:"Click to copy this to your clipboard\n\n",color:"gray"},{storage:"spellcrafter:tmp",nbt:"trigger.code.characters",color:"dark_gray",interpret:true}]}},{text:"> ",color:"#965ed6", bold:true},{text:"Wand code generated - click to copy",color:"gray"}]
