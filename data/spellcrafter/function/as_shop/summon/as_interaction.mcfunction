#> executed by a new interaction entity

# Inputs
execute unless score $shop.id spellcrafter.tmp matches 0.. run scoreboard players set $shop.id spellcrafter.tmp 0
execute unless score $shop.type spellcrafter.tmp matches 0.. run scoreboard players set $shop.type spellcrafter.tmp 0
execute unless score $shop.uses spellcrafter.tmp matches 1.. run scoreboard players set $shop.uses spellcrafter.tmp 1
execute unless score $shop.value spellcrafter.tmp matches 1.. run scoreboard players set $shop.value spellcrafter.tmp 1

scoreboard players operation @s spellcrafter.id = $shop.id spellcrafter.tmp
scoreboard players operation @s spellcrafter.shop.uses = $shop.uses spellcrafter.tmp
scoreboard players operation @s spellcrafter.shop.value = $shop.value spellcrafter.tmp


# Interaction entity data
tag @s add spellcrafter.shop
tag @s add spellcrafter.shop.tmp
tag @s add spellcrafter.shop.interaction
data merge entity @s {width:0.45f,height:0.6f,response:1b}


# Summon item display
execute summon minecraft:item_display run function spellcrafter:as_shop/summon/as_item_display


# Summon text display - using "execute summon" shows an error in the console. This fixes that
summon minecraft:text_display ~ ~ ~ {Tags:["spellcrafter.shop","spellcrafter.shop.tmp","spellcrafter.shop.text"],billboard:"vertical",alignment:"center",view_range:1.0f,text:'{"text":"1"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.3f,0f],scale:[1f,1f,1f]}}
execute as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=spellcrafter.shop.text,tag=spellcrafter.shop.tmp] run function spellcrafter:as_shop/summon/as_text_display
tag @s remove spellcrafter.shop.tmp


# Get item
function spellcrafter:as_shop/set_item/init
function spellcrafter:as_shop/update
