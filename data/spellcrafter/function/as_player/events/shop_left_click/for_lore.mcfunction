#> as player
#> recursive (limited by score "$iter" spellcrafter.tmp)

tellraw @p[distance=..10,tag=spellcrafter.shop.tmp] ["   ",{"nbt":"lore[0]","storage":"spellcrafter:tmp","interpret":true}]

data remove storage spellcrafter:tmp lore[0]
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:as_player/events/shop_left_click/for_lore
