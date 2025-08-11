#> as player


# Place buttons
item replace entity @s inventory.8 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.prev",fallback:"Previous Page"},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:1}},minecraft:custom_model_data={strings:["spellcrafter.gui.arrow_up"]}]
item replace entity @s inventory.17 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.trash",fallback:"Trash"},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:2}},minecraft:custom_model_data={strings:["spellcrafter.gui.trash"]}]
item replace entity @s inventory.26 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.next",fallback:"Next Page"},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:3}},minecraft:custom_model_data={strings:["spellcrafter.gui.arrow_down"]}]


# Pages
execute if score @s spellcrafter.inf_page matches 101 run function spellcrafter:as_player/inf_spells/page_1
execute if score @s spellcrafter.inf_page matches 102 run function spellcrafter:as_player/inf_spells/page_2
execute if score @s spellcrafter.inf_page matches 103 run function spellcrafter:as_player/inf_spells/page_3
execute if score @s spellcrafter.inf_page matches 104 run function spellcrafter:as_player/inf_spells/page_4
execute if score @s spellcrafter.inf_page matches 105 run function spellcrafter:as_player/inf_spells/page_5
execute if score @s spellcrafter.inf_page matches 106 run function spellcrafter:as_player/inf_spells/page_6
execute if score @s spellcrafter.inf_page matches 107 run function spellcrafter:as_player/inf_spells/page_7
execute if score @s spellcrafter.inf_page matches 108 run function spellcrafter:as_player/inf_spells/page_8


# Clear UI items
execute if items entity @s player.cursor minecraft:knowledge_book run item replace entity @s player.cursor with minecraft:air
execute if items entity @s hotbar.0 minecraft:knowledge_book run item replace entity @s hotbar.0 with minecraft:air
execute if items entity @s hotbar.1 minecraft:knowledge_book run item replace entity @s hotbar.1 with minecraft:air
execute if items entity @s hotbar.2 minecraft:knowledge_book run item replace entity @s hotbar.2 with minecraft:air
execute if items entity @s hotbar.3 minecraft:knowledge_book run item replace entity @s hotbar.3 with minecraft:air
execute if items entity @s hotbar.4 minecraft:knowledge_book run item replace entity @s hotbar.4 with minecraft:air
execute if items entity @s hotbar.5 minecraft:knowledge_book run item replace entity @s hotbar.5 with minecraft:air
execute if items entity @s hotbar.6 minecraft:knowledge_book run item replace entity @s hotbar.6 with minecraft:air
execute if items entity @s hotbar.7 minecraft:knowledge_book run item replace entity @s hotbar.7 with minecraft:air
execute if items entity @s hotbar.8 minecraft:knowledge_book run item replace entity @s hotbar.8 with minecraft:air


# Resume event triggers
scoreboard players remove @s spellcrafter.inf_page 100
