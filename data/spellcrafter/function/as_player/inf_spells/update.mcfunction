#> as player


# Clear buttons (held item)
clear @s minecraft:arrow[minecraft:custom_data={spellcrafter:{gui:1}}]
clear @s minecraft:lava_bucket[minecraft:custom_data={spellcrafter:{gui:2}}]
clear @s minecraft:arrow[minecraft:custom_data={spellcrafter:{gui:3}}]


# Place buttons
item replace entity @s inventory.8 with minecraft:arrow[minecraft:item_name='{"text":"Previous Page"}',minecraft:custom_data={spellcrafter:{gui:1}}]
item replace entity @s inventory.17 with minecraft:lava_bucket[minecraft:item_name='{"text":"Trash"}',minecraft:custom_data={spellcrafter:{gui:2}}]
item replace entity @s inventory.26 with minecraft:arrow[minecraft:item_name='{"text":"Next Page"}',minecraft:custom_data={spellcrafter:{gui:3}}]


# Pages
execute if score @s spellcrafter.inf_page matches 101 run function spellcrafter:as_player/inf_spells/page_1
execute if score @s spellcrafter.inf_page matches 102 run function spellcrafter:as_player/inf_spells/page_2
execute if score @s spellcrafter.inf_page matches 103 run function spellcrafter:as_player/inf_spells/page_3
execute if score @s spellcrafter.inf_page matches 104 run function spellcrafter:as_player/inf_spells/page_4
execute if score @s spellcrafter.inf_page matches 105 run function spellcrafter:as_player/inf_spells/page_5
execute if score @s spellcrafter.inf_page matches 106 run function spellcrafter:as_player/inf_spells/page_6
execute if score @s spellcrafter.inf_page matches 107 run function spellcrafter:as_player/inf_spells/page_7


# Resume event triggers
scoreboard players remove @s spellcrafter.inf_page 100
