#> as player


# Update custom wand
function isc:as_player/inf_spells/custom_wand/update


# Reset buttons
clear @s minecraft:paper[minecraft:custom_data={isc:{gui:4}}]
clear @s minecraft:paper[minecraft:custom_data={isc:{gui:5}}]
clear @s minecraft:paper[minecraft:custom_data={isc:{gui:6}}]
clear @s minecraft:paper[minecraft:custom_data={isc:{gui:7}}]
clear @s minecraft:paper[minecraft:custom_data={isc:{gui:8}}]
clear @s minecraft:paper[minecraft:custom_data={isc:{gui:9}}]
clear @s minecraft:red_stained_glass_pane[minecraft:custom_data={isc:{gui:10}}]


# Menu items
item replace entity @s inventory.0 with minecraft:air
item replace entity @s inventory.1 with minecraft:air
item replace entity @s inventory.2 with minecraft:air
item replace entity @s inventory.3 with minecraft:paper[minecraft:item_name='{"text":"Slots ↓"}',minecraft:custom_data={isc:{gui:4}}]
item replace entity @s inventory.4 with minecraft:air
item replace entity @s inventory.5 with minecraft:paper[minecraft:item_name='{"text":"Slots ↑"}',minecraft:custom_data={isc:{gui:5}}]
item replace entity @s inventory.6 with minecraft:air
item replace entity @s inventory.7 with minecraft:air

item replace entity @s inventory.9 with minecraft:air
item replace entity @s inventory.10 with minecraft:air
item replace entity @s inventory.11 with minecraft:air
item replace entity @s inventory.12 with minecraft:paper[minecraft:item_name='{"text":"Base Mana ↓"}',minecraft:custom_data={isc:{gui:6}}]
# inventory.13 -> custom wand
item replace entity @s inventory.14 with minecraft:paper[minecraft:item_name='{"text":"Base Mana ↑"}',minecraft:custom_data={isc:{gui:7}}]
item replace entity @s inventory.15 with minecraft:air
item replace entity @s inventory.16 with minecraft:air

item replace entity @s inventory.18 with minecraft:air
item replace entity @s inventory.19 with minecraft:air
item replace entity @s inventory.20 with minecraft:air
item replace entity @s inventory.21 with minecraft:paper[minecraft:item_name='{"text":"Base Cooldown ↓"}',minecraft:custom_data={isc:{gui:8}}]
execute unless items entity @s inventory.22 #isc:spell run item replace entity @s inventory.22 with minecraft:red_stained_glass_pane[minecraft:item_name='{"text":"Wand Modifier"}',minecraft:custom_data={isc:{gui:10}}]
item replace entity @s inventory.23 with minecraft:paper[minecraft:item_name='{"text":"Base Cooldown ↑"}',minecraft:custom_data={isc:{gui:9}}]
item replace entity @s inventory.24 with minecraft:air
item replace entity @s inventory.25 with minecraft:air
