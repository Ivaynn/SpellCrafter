#> Advancement reward
advancement revoke @s only spellcrafter:events/shop_left_click


tag @s add spellcrafter.shop.tmp
execute as @e[distance=..10,sort=nearest,type=minecraft:interaction,tag=spellcrafter.shop.interaction] run function spellcrafter:as_player/events/shop_left_click/as_shop
tag @s remove spellcrafter.shop.tmp
