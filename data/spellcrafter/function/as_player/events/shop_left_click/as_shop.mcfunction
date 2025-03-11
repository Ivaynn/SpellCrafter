#> as interaction entity, at player


# Check if this is the correct entity
scoreboard players set $shop.this spellcrafter.tmp 0
execute on attacker if entity @s[tag=spellcrafter.shop.tmp] run scoreboard players set $shop.this spellcrafter.tmp 1
data remove entity @s attack
execute if score $shop.this spellcrafter.tmp matches 0 run return 0


# Get item data
data remove storage spellcrafter:tmp item
execute on passengers as @s[tag=spellcrafter.shop.item] run data modify storage spellcrafter:tmp item set from entity @s item


# Display item data in chat
execute as @p[distance=..10,tag=spellcrafter.shop.tmp] run function spellcrafter:as_player/events/shop_left_click/tellraw
