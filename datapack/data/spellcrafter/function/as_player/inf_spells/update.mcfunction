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


# Clear buttons (held item)
execute if items entity @s player.cursor minecraft:knowledge_book run item replace entity @s player.cursor with minecraft:air


# Resume event triggers
scoreboard players remove @s spellcrafter.inf_page 100
