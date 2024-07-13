#> executed by a new interaction entity

tag @s add isc.shop
tag @s add isc.shop.tmp
tag @s add isc.shop.interaction
scoreboard players set @s isc.shop.value 1

data merge entity @s {width:0.7f,height:0.85f,response:1b}
execute summon minecraft:item_display run function isc:as_shop/summon/as_item_display


# Summon text display - using "execute summon" shows an error in the console. This fixes that
summon minecraft:text_display ~ ~ ~ {Tags:["isc.shop","isc.shop.tmp","isc.shop.text"],billboard:"vertical",alignment:"center",view_range:1.0f,text:'{"text":"123"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.8f,0f],scale:[1f,1f,1f]}}
execute as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=isc.shop.text,tag=isc.shop.tmp] run function isc:as_shop/summon/as_text_display


tag @s remove isc.shop.tmp
