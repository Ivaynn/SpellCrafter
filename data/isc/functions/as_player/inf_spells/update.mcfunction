#> as player


# Clear buttons (held item)
clear @s minecraft:arrow[minecraft:custom_data={isc:{gui:1}}]
clear @s minecraft:arrow[minecraft:custom_data={isc:{gui:2}}]
clear @s minecraft:spectral_arrow[minecraft:custom_data={isc:{gui:3}}]
clear @s minecraft:spectral_arrow[minecraft:custom_data={isc:{gui:4}}]
clear @s minecraft:red_dye[minecraft:custom_data={isc:{gui:5}}]
clear @s minecraft:blaze_powder[minecraft:custom_data={isc:{gui:6}}]


# Place buttons
item replace entity @s inventory.0 with minecraft:arrow[minecraft:item_name="Previous",minecraft:custom_data={isc:{gui:1}}]
item replace entity @s inventory.8 with minecraft:arrow[minecraft:item_name="Next",minecraft:custom_data={isc:{gui:2}}]
item replace entity @s inventory.9 with minecraft:spectral_arrow[minecraft:item_name="First",minecraft:custom_data={isc:{gui:3}}]
item replace entity @s inventory.17 with minecraft:spectral_arrow[minecraft:item_name="Last",minecraft:custom_data={isc:{gui:4}}]
item replace entity @s inventory.18 with minecraft:red_dye[minecraft:item_name="Exit",minecraft:custom_data={isc:{gui:5}}]
item replace entity @s inventory.26 with minecraft:blaze_powder[minecraft:item_name="Trash",minecraft:custom_data={isc:{gui:6}}]


# Pages
execute if score @s isc.inf_page matches 101 run function isc:as_player/inf_spells/page_1
execute if score @s isc.inf_page matches 102 run function isc:as_player/inf_spells/page_2
execute if score @s isc.inf_page matches 103 run function isc:as_player/inf_spells/page_3
execute if score @s isc.inf_page matches 104 run function isc:as_player/inf_spells/page_4


# Resume event triggers
scoreboard players remove @s isc.inf_page 100
