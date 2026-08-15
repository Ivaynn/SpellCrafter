#> as player


# Prevent lost items
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.1 minecraft:air if items entity @s inventory.1 * run item replace entity @s player.cursor from entity @s inventory.1
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.2 minecraft:air if items entity @s inventory.2 * run item replace entity @s player.cursor from entity @s inventory.2
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.3 minecraft:knowledge_book if items entity @s inventory.3 * run item replace entity @s player.cursor from entity @s inventory.3
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.4 minecraft:knowledge_book if items entity @s inventory.4 * run item replace entity @s player.cursor from entity @s inventory.4
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.5 minecraft:knowledge_book if items entity @s inventory.5 * run item replace entity @s player.cursor from entity @s inventory.5
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.6 minecraft:air if items entity @s inventory.6 * run item replace entity @s player.cursor from entity @s inventory.6
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.7 minecraft:air if items entity @s inventory.7 * run item replace entity @s player.cursor from entity @s inventory.7

execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.9 minecraft:cookie if items entity @s inventory.9 * run item replace entity @s player.cursor from entity @s inventory.9
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.10 minecraft:air if items entity @s inventory.10 * run item replace entity @s player.cursor from entity @s inventory.10
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.11 minecraft:air if items entity @s inventory.11 * run item replace entity @s player.cursor from entity @s inventory.11
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.12 minecraft:knowledge_book if items entity @s inventory.12 * run item replace entity @s player.cursor from entity @s inventory.12
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.13 #spellcrafter:wand unless items entity @s inventory.13 minecraft:knowledge_book if items entity @s inventory.13 * if items entity @s player.cursor minecraft:knowledge_book run item replace entity @s player.cursor from entity @s inventory.13
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.14 minecraft:knowledge_book if items entity @s inventory.14 * run item replace entity @s player.cursor from entity @s inventory.14
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.15 minecraft:air if items entity @s inventory.15 * run item replace entity @s player.cursor from entity @s inventory.15
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.16 minecraft:air if items entity @s inventory.16 * run item replace entity @s player.cursor from entity @s inventory.16

execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.19 minecraft:air if items entity @s inventory.19 * run item replace entity @s player.cursor from entity @s inventory.19
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.20 minecraft:air if items entity @s inventory.20 * run item replace entity @s player.cursor from entity @s inventory.20
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.21 minecraft:knowledge_book if items entity @s inventory.21 * run item replace entity @s player.cursor from entity @s inventory.21
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.22 #spellcrafter:spell unless items entity @s inventory.22 minecraft:knowledge_book if items entity @s inventory.22 * run item replace entity @s player.cursor from entity @s inventory.22
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.23 minecraft:knowledge_book if items entity @s inventory.23 * run item replace entity @s player.cursor from entity @s inventory.23
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.24 minecraft:air if items entity @s inventory.24 * run item replace entity @s player.cursor from entity @s inventory.24
execute unless score $page_changed spellcrafter.tmp matches 1 unless items entity @s inventory.25 minecraft:air if items entity @s inventory.25 * run item replace entity @s player.cursor from entity @s inventory.25

execute if score $page_changed spellcrafter.tmp matches 1 run item replace entity @s inventory.0 with minecraft:air
execute if score $page_changed spellcrafter.tmp matches 1 run item replace entity @s inventory.13 with minecraft:air
execute if score $page_changed spellcrafter.tmp matches 1 run item replace entity @s inventory.18 with minecraft:air


# Update custom wand
execute if score $page_changed spellcrafter.tmp matches 1 run function spellcrafter:as_player/inf_spells/custom_wand/clear_wand
execute if score $page_changed spellcrafter.tmp matches 1 run function spellcrafter:as_player/inf_spells/custom_wand/clear_mod
function spellcrafter:as_player/inf_spells/custom_wand/update


# Menu items
execute unless items entity @s inventory.0 * run loot replace entity @s inventory.0 loot spellcrafter:wand
item replace entity @s inventory.1 with minecraft:air
item replace entity @s inventory.2 with minecraft:air
item replace entity @s inventory.3 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.slots",fallback:"Slots",extra:[{text:" ↓"}]},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:4}},minecraft:custom_model_data={strings:["spellcrafter.gui.slots_down"]}]
# inventory.4 -> appearance (wand info backup)
item replace entity @s inventory.5 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.slots",fallback:"Slots",extra:[{text:" ↑"}]},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:5}},minecraft:custom_model_data={strings:["spellcrafter.gui.slots_up"]}]
item replace entity @s inventory.6 with minecraft:air
item replace entity @s inventory.7 with minecraft:air

loot replace entity @s inventory.9 loot spellcrafter:cookie
item modify entity @s inventory.9 spellcrafter:set_count_16
item replace entity @s inventory.10 with minecraft:air
item replace entity @s inventory.11 with minecraft:air
item replace entity @s inventory.12 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.base_cooldown",fallback:"Base Cooldown",extra:[{text:" ↓"}]},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:8}},minecraft:custom_model_data={strings:["spellcrafter.gui.cooldown_down"]}]
# inventory.13 -> custom wand
item replace entity @s inventory.14 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.base_cooldown",fallback:"Base Cooldown",extra:[{text:" ↑"}]},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:9}},minecraft:custom_model_data={strings:["spellcrafter.gui.cooldown_up"]}]
item replace entity @s inventory.15 with minecraft:air
item replace entity @s inventory.16 with minecraft:air

execute unless items entity @s inventory.18 * run function spellcrafter:as_player/inf_spells/random_wand
item replace entity @s inventory.19 with minecraft:air
item replace entity @s inventory.20 with minecraft:air
item replace entity @s inventory.21 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.base_mana",fallback:"Base Mana",extra:[{text:" ↓"}]},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:6}},minecraft:custom_model_data={strings:["spellcrafter.gui.mana_down"]}]
execute unless items entity @s inventory.22 #spellcrafter:spell unless items entity @s inventory.22 minecraft:knowledge_book run function spellcrafter:as_player/inf_spells/custom_wand/clear_mod
item replace entity @s inventory.23 with minecraft:knowledge_book[minecraft:item_name={translate:"spellcrafter.gui.base_mana",fallback:"Base Mana",extra:[{text:" ↑"}]},minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:7}},minecraft:custom_model_data={strings:["spellcrafter.gui.mana_up"]}]
item replace entity @s inventory.24 with minecraft:air
item replace entity @s inventory.25 with minecraft:air
