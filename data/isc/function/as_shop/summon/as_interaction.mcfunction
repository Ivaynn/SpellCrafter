#> executed by a new interaction entity

# Inputs
execute unless score $shop.id isc.tmp matches 0.. run scoreboard players set $shop.id isc.tmp 0
execute unless score $shop.type isc.tmp matches 0.. run scoreboard players set $shop.type isc.tmp 0
execute unless score $shop.uses isc.tmp matches 1.. run scoreboard players set $shop.uses isc.tmp 1
execute unless score $shop.value isc.tmp matches 1.. run scoreboard players set $shop.value isc.tmp 1

scoreboard players operation @s isc.id = $shop.id isc.tmp
scoreboard players operation @s isc.shop.uses = $shop.uses isc.tmp
scoreboard players operation @s isc.shop.value = $shop.value isc.tmp


# Interaction entity data
tag @s add isc.shop
tag @s add isc.shop.tmp
tag @s add isc.shop.interaction
data merge entity @s {width:0.45f,height:0.6f,response:1b}


# Summon item display
execute summon minecraft:item_display run function isc:as_shop/summon/as_item_display


# Summon text display - using "execute summon" shows an error in the console. This fixes that
summon minecraft:text_display ~ ~ ~ {Tags:["isc.shop","isc.shop.tmp","isc.shop.text"],billboard:"vertical",alignment:"center",view_range:1.0f,text:'{"text":"1"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.6f,0f],scale:[1f,1f,1f]}}
execute as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=isc.shop.text,tag=isc.shop.tmp] run function isc:as_shop/summon/as_text_display
tag @s remove isc.shop.tmp


# Get item
function isc:as_shop/set_item/init
function isc:as_shop/update
