#> as player (scheduled by advancement "inf_inventory_changed")


# Buttons
execute unless data entity @s Inventory[{Slot:17b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:1}}}}] unless score @s spellcrafter.inf_page matches ..101 run scoreboard players remove @s spellcrafter.inf_page 1
# execute unless data entity @s Inventory[{Slot:26b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:2}}}}] run say trash
execute unless data entity @s Inventory[{Slot:35b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:3}}}}] unless score @s spellcrafter.inf_page matches 107.. run scoreboard players add @s spellcrafter.inf_page 1


# Update inventory
function spellcrafter:as_player/inf_spells/update

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[distance=..50,sort=nearest,type=minecraft:block_display,tag=spellcrafter.table,predicate=spellcrafter:match_id] at @s positioned ~ ~-1 ~ run function spellcrafter:as_player/inf_spells/as_table
