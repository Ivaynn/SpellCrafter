#> executed by a new item display

tag @s add isc.shop
tag @s add isc.shop.item
data merge entity @s {billboard:"vertical",item:{id:"minecraft:barrier"},transformation:{translation:[0.0f,0.5f,0.0f],scale:[0.5f,0.5f,0.5f]}}
ride @s mount @e[distance=..0.001,limit=1,type=minecraft:interaction,tag=isc.shop.interaction,tag=isc.shop.tmp]
