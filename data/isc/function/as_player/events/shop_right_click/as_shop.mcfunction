#> as interaction entity, at player


# Check if this is the correct entity
scoreboard players set $shop.this isc.tmp 0
execute on target if entity @s[tag=isc.shop.tmp] run scoreboard players set $shop.this isc.tmp 1
data remove entity @s interaction
execute if score $shop.this isc.tmp matches 0 run return 0


# Check if this is the correct player
execute if score @s isc.id matches 1.. unless score @p[distance=..0.001,tag=isc.shop.tmp] isc.id = @s isc.id run return run scoreboard players set $shop.result isc.tmp 2


# Check if player has enough currency to buy the item
scoreboard players set $player_xp isc.tmp 0
execute store result score $player_xp isc.tmp run xp query @p[distance=..0.001,tag=isc.shop.tmp] levels

execute if score @s isc.shop.value > $player_xp isc.tmp run return run scoreboard players set $shop.result isc.tmp 1


# Take player's xp
scoreboard players operation $iter isc.tmp = @s isc.shop.value
execute as @p[distance=..0.001,tag=isc.shop.tmp] run function isc:as_player/events/shop_right_click/for_level


# Get item data
data remove storage isc:tmp item
execute on passengers as @s[tag=isc.shop.item] run data modify storage isc:tmp item set from entity @s item


# Give item to player
execute as @p[distance=..0.001,tag=isc.shop.tmp] at @s anchored eyes positioned ^ ^-0.25 ^-0.25 run function isc:as_player/events/shop_right_click/summon_item


# Complete
execute at @s run particle minecraft:happy_villager ~ ~.3 ~ .15 .15 .15 1 5 normal
function isc:as_shop/remove
scoreboard players set $shop.result isc.tmp 3
