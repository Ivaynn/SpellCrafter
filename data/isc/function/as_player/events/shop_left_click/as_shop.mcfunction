#> as interaction entity, at player


# Check if this is the correct entity
scoreboard players set $shop.this isc.tmp 0
execute on attacker if entity @s[tag=isc.shop.tmp] run scoreboard players set $shop.this isc.tmp 1
data remove entity @s attack
execute if score $shop.this isc.tmp matches 0 run return 0


# Get item data
data remove storage isc:tmp item
execute on passengers as @s[tag=isc.shop.item] run data modify storage isc:tmp item set from entity @s item


# Display item data in chat
execute as @p[distance=..10,tag=isc.shop.tmp] run function isc:as_player/events/shop_left_click/tellraw
