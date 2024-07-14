#> Advancement reward
advancement revoke @s only isc:events/shop_right_click

scoreboard players set $shop.result isc.tmp 0

tag @s add isc.shop.tmp
execute as @e[distance=..10,sort=nearest,type=minecraft:interaction,tag=isc.shop.interaction] run function isc:as_player/events/shop_right_click/as_shop
tag @s remove isc.shop.tmp

execute if score $shop.result isc.tmp matches 1 run tellraw @s ["",{"text":"> ","color":"red","bold":true},{"text":"You don't have enough XP!","color":"gray"}]
execute if score $shop.result isc.tmp matches 2 run tellraw @s ["",{"text":"> ","color":"red","bold":true},{"text":"You can't use this shop!","color":"gray"}]
execute if score $shop.result isc.tmp matches 3 run tellraw @s ["",{"text":"> ","color":"dark_aqua","bold":true},{"text":"You bought ","color":"gray"},{"nbt":"item.components.\"minecraft:item_name\"","storage":"isc:tmp","interpret":true,"color":"light_purple"}]
