#> as player
#> recursive (limited by score "$iter" spellcrafter.tmp)

xp add @s -1 levels
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:as_player/events/shop_right_click/for_level
