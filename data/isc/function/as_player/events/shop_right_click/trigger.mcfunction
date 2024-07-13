#> Advancement reward
advancement revoke @s only isc:events/shop_right_click

scoreboard players set $shop.result isc.tmp 0

tag @s add isc.shop.tmp
execute as @e[distance=..10,sort=nearest,type=minecraft:interaction,tag=isc.shop.interaction] at @s run function isc:as_player/events/shop_right_click/as_shop
tag @s remove isc.shop.tmp

execute if score $shop.result isc.tmp matches 1 run tellraw @s ["",{"text":"<SpellCrafter> ","color":"dark_aqua"},{"text":"You don't have enough XP to buy this!","color":"gray"}]
execute if score $shop.result isc.tmp matches 2 run tellraw @s ["",{"text":"<SpellCrafter> ","color":"dark_aqua"},{"text":"You bought ","color":"gray"},{"nbt":"item.components.\"minecraft:item_name\"","storage":"isc:tmp","interpret":true,"color":"light_purple"}]
execute if score $shop.result isc.tmp matches 2 run playsound minecraft:entity.item.pickup player @s ~ ~ ~ 1 2
