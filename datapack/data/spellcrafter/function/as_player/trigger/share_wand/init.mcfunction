
# Cancel if this isn't a wand
execute unless predicate spellcrafter:holding_wand run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.valid run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"You must be holding a wand to use this!",color:"gray"}]


# Get data
data modify storage spellcrafter:tmp trigger.share set value {}
data modify storage spellcrafter:tmp trigger.share.item.components set from entity @s SelectedItem.components
data modify storage spellcrafter:tmp trigger.share.item.name set from entity @s SelectedItem.components."minecraft:custom_name"
execute unless data storage spellcrafter:tmp trigger.share.item.name run data modify storage spellcrafter:tmp trigger.share.item.name set value {"translate": "spellcrafter.wand.name", "fallback": "Wand","italic": false}


# Build and send message
function spellcrafter:as_player/trigger/share_wand/macro with storage spellcrafter:tmp trigger.share.item
tellraw @a ["",{text:"> ",color:"#965ed6", bold:true},{selector:"@s"},{text:" is showcasing ",color:"gray"},{storage:"spellcrafter:tmp",nbt:"trigger.share.json",interpret:true,color:"light_purple",extra:[{text:"[",color:"light_purple"},{storage:"spellcrafter:tmp",nbt:"trigger.share.item.name",color:"light_purple",interpret:true},{text:"]",color:"light_purple"}]}]
