#> Advancement reward
advancement revoke @s only isc:events/shop_right_click


tag @s add isc.shop.tmp
execute as @e[distance=..10,sort=nearest,type=minecraft:interaction,tag=isc.shop.interaction] run function isc:as_player/events/shop_right_click/as_shop
tag @s remove isc.shop.tmp
