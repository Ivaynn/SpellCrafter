#> as player
#> recursive (limited by score "$iter" isc.tmp)

tellraw @p[distance=..10,tag=isc.shop.tmp] ["   ",{"nbt":"lore[0]","storage":"isc:tmp","interpret":true}]

data remove storage isc:tmp lore[0]
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_player/events/shop_left_click/for_lore
