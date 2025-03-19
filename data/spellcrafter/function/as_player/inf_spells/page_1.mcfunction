#> as player


# Update custom wand
execute if score $page_changed spellcrafter.tmp matches 1 run function spellcrafter:as_player/inf_spells/custom_wand/clear_wand
execute if score $page_changed spellcrafter.tmp matches 1 run function spellcrafter:as_player/inf_spells/custom_wand/clear_mod
function spellcrafter:as_player/inf_spells/custom_wand/update


# Menu items
loot replace entity @s inventory.0 loot spellcrafter:wands/t0/starter
item replace entity @s inventory.1 with minecraft:air
item replace entity @s inventory.2 with minecraft:air
item replace entity @s inventory.3 with minecraft:knowledge_book[minecraft:item_name='{"text":"Slots ↓"}',minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:4}},minecraft:custom_model_data={"strings":["spellcrafter.gui.slots_down"]}]
# inventory.4 -> appearance (wand info backup)
item replace entity @s inventory.5 with minecraft:knowledge_book[minecraft:item_name='{"text":"Slots ↑"}',minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:5}},minecraft:custom_model_data={"strings":["spellcrafter.gui.slots_up"]}]
item replace entity @s inventory.6 with minecraft:air
item replace entity @s inventory.7 with minecraft:air

loot replace entity @s inventory.9 loot spellcrafter:wands/basic
item replace entity @s inventory.10 with minecraft:air
item replace entity @s inventory.11 with minecraft:air
item replace entity @s inventory.12 with minecraft:knowledge_book[minecraft:item_name='{"text":"Base Cooldown ↓"}',minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:8}},minecraft:custom_model_data={"strings":["spellcrafter.gui.cooldown_down"]}]
# inventory.13 -> custom wand
item replace entity @s inventory.14 with minecraft:knowledge_book[minecraft:item_name='{"text":"Base Cooldown ↑"}',minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:9}},minecraft:custom_model_data={"strings":["spellcrafter.gui.cooldown_up"]}]
item replace entity @s inventory.15 with minecraft:air
item replace entity @s inventory.16 with minecraft:air

loot replace entity @s inventory.18 loot spellcrafter:wands/leaf
item replace entity @s inventory.19 with minecraft:air
item replace entity @s inventory.20 with minecraft:air
item replace entity @s inventory.21 with minecraft:knowledge_book[minecraft:item_name='{"text":"Base Mana ↓"}',minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:6}},minecraft:custom_model_data={"strings":["spellcrafter.gui.mana_down"]}]
execute unless items entity @s inventory.22 #spellcrafter:spell run function spellcrafter:as_player/inf_spells/custom_wand/clear_mod
item replace entity @s inventory.23 with minecraft:knowledge_book[minecraft:item_name='{"text":"Base Mana ↑"}',minecraft:rarity="common",minecraft:custom_data={spellcrafter:{gui:7}},minecraft:custom_model_data={"strings":["spellcrafter.gui.mana_up"]}]
item replace entity @s inventory.24 with minecraft:air
item replace entity @s inventory.25 with minecraft:air
