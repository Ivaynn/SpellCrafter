#> as player


# Prevent lost items
execute unless items entity @s inventory.8 minecraft:knowledge_book if items entity @s inventory.8 * run item replace entity @s player.cursor from entity @s inventory.8
execute unless items entity @s inventory.26 minecraft:knowledge_book if items entity @s inventory.26 * run item replace entity @s player.cursor from entity @s inventory.26

execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.0 #spellcrafter:spell if items entity @s inventory.0 * run item replace entity @s player.cursor from entity @s inventory.0
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.1 #spellcrafter:spell if items entity @s inventory.1 * run item replace entity @s player.cursor from entity @s inventory.1
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.2 #spellcrafter:spell if items entity @s inventory.2 * run item replace entity @s player.cursor from entity @s inventory.2
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.3 #spellcrafter:spell if items entity @s inventory.3 * run item replace entity @s player.cursor from entity @s inventory.3
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.4 #spellcrafter:spell if items entity @s inventory.4 * run item replace entity @s player.cursor from entity @s inventory.4
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.5 #spellcrafter:spell if items entity @s inventory.5 * run item replace entity @s player.cursor from entity @s inventory.5
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.6 #spellcrafter:spell if items entity @s inventory.6 * run item replace entity @s player.cursor from entity @s inventory.6
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.7 #spellcrafter:spell if items entity @s inventory.7 * run item replace entity @s player.cursor from entity @s inventory.7

execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.9 #spellcrafter:spell if items entity @s inventory.9 * run item replace entity @s player.cursor from entity @s inventory.9
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.10 #spellcrafter:spell if items entity @s inventory.10 * run item replace entity @s player.cursor from entity @s inventory.10
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.11 #spellcrafter:spell if items entity @s inventory.11 * run item replace entity @s player.cursor from entity @s inventory.11
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.12 #spellcrafter:spell if items entity @s inventory.12 * run item replace entity @s player.cursor from entity @s inventory.12
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.13 #spellcrafter:spell if items entity @s inventory.13 * run item replace entity @s player.cursor from entity @s inventory.13
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.14 #spellcrafter:spell if items entity @s inventory.14 * run item replace entity @s player.cursor from entity @s inventory.14
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.15 #spellcrafter:spell if items entity @s inventory.15 * run item replace entity @s player.cursor from entity @s inventory.15
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.16 #spellcrafter:spell if items entity @s inventory.16 * run item replace entity @s player.cursor from entity @s inventory.16

execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.18 #spellcrafter:spell if items entity @s inventory.18 * run item replace entity @s player.cursor from entity @s inventory.18
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.19 #spellcrafter:spell if items entity @s inventory.19 * run item replace entity @s player.cursor from entity @s inventory.19
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.20 #spellcrafter:spell if items entity @s inventory.20 * run item replace entity @s player.cursor from entity @s inventory.20
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.21 #spellcrafter:spell if items entity @s inventory.21 * run item replace entity @s player.cursor from entity @s inventory.21
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.22 #spellcrafter:spell if items entity @s inventory.22 * run item replace entity @s player.cursor from entity @s inventory.22
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.23 #spellcrafter:spell if items entity @s inventory.23 * run item replace entity @s player.cursor from entity @s inventory.23
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.24 #spellcrafter:spell if items entity @s inventory.24 * run item replace entity @s player.cursor from entity @s inventory.24
execute if score @s spellcrafter.inf_page matches 102..107 unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.25 #spellcrafter:spell if items entity @s inventory.25 * run item replace entity @s player.cursor from entity @s inventory.25


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
