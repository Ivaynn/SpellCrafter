
scoreboard players set $page_changed spellcrafter.tmp 0

execute unless data entity @s Inventory[{Slot:35b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:3}}}}] run function spellcrafter:as_player/inf_spells/next_page
execute unless data entity @s Inventory[{Slot:17b,id:"minecraft:knowledge_book",components:{"minecraft:custom_data":{spellcrafter:{gui:1}}}}] run function spellcrafter:as_player/inf_spells/prev_page

execute unless score @s spellcrafter.inf_page matches ..107 run scoreboard players set @s spellcrafter.inf_page 107
execute unless score @s spellcrafter.inf_page matches 101.. run scoreboard players set @s spellcrafter.inf_page 101
