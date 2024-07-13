#> as player
#> recursive (limited by score "$iter" isc.tmp)

xp add @s -1 levels
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_player/events/shop_right_click/for_level
