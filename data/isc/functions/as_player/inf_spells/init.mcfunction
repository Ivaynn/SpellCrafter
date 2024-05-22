#> as player (scheduled by advancement "inf_inventory_changed")


# Buttons
# execute unless data entity @s Inventory[{Slot:27,id:"minecraft:bucket",components:{"minecraft:custom_data":{isc:{gui:5}}}}] run say trash
execute unless data entity @s Inventory[{Slot:9b,id:"minecraft:arrow",components:{"minecraft:custom_data":{isc:{gui:1}}}}] unless score @s isc.inf_page matches ..101 run scoreboard players remove @s isc.inf_page 1
execute unless data entity @s Inventory[{Slot:17b,id:"minecraft:arrow",components:{"minecraft:custom_data":{isc:{gui:2}}}}] unless score @s isc.inf_page matches 105.. run scoreboard players add @s isc.inf_page 1
execute unless data entity @s Inventory[{Slot:18b,id:"minecraft:spectral_arrow",components:{"minecraft:custom_data":{isc:{gui:3}}}}] run scoreboard players set @s isc.inf_page 101
execute unless data entity @s Inventory[{Slot:26b,id:"minecraft:spectral_arrow",components:{"minecraft:custom_data":{isc:{gui:4}}}}] run scoreboard players set @s isc.inf_page 105
# execute unless data entity @s Inventory[{Slot:35b,id:"minecraft:bucket",components:{"minecraft:custom_data":{isc:{gui:6}}}}] run say trash


# Update inventory
function isc:as_player/inf_spells/update
