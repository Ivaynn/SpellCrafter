#> as player (scheduled by advancement "inf_inventory_changed")


# Buttons
scoreboard players set $page_changed spellcrafter.tmp 0
execute unless data entity @s Inventory[{Slot:17b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:1}}}}] run function spellcrafter:as_player/inf_spells/prev_page
# execute unless data entity @s Inventory[{Slot:26b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:2}}}}] run say trash
execute unless data entity @s Inventory[{Slot:35b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:3}}}}] run function spellcrafter:as_player/inf_spells/next_page


# Update inventory
function spellcrafter:as_player/inf_spells/update


# Remove gui items from table (fix shift-clicking)
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[distance=..50,sort=nearest,type=minecraft:item_display,tag=spellcrafter.table,predicate=spellcrafter:match_id] at @s positioned ~ ~-1 ~ run function spellcrafter:as_player/inf_spells/as_table
