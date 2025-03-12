#> executed by a new item display

tag @s add spellcrafter.shop
tag @s add spellcrafter.shop.item
data merge entity @s {billboard:"vertical",item_display:"fixed",item:{id:"minecraft:oak_button"},transformation:{translation:[0.0f,-0.3f,0.0f],scale:[0.6f,0.6f,0.6f]}}
ride @s mount @e[distance=..0.001,limit=1,type=minecraft:interaction,tag=spellcrafter.shop.interaction,tag=spellcrafter.shop.tmp]
