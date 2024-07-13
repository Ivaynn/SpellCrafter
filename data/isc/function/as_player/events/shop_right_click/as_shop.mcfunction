#> as interaction entity, at @s


# Check if this is the correct entity
scoreboard players set $shop.this isc.tmp 0
execute on target if entity @s[tag=isc.shop.tmp] run scoreboard players set $shop.this isc.tmp 1
data remove entity @s interaction
execute if score $shop.this isc.tmp matches 0 run return 0


# Check if player has enough currency to buy the item
scoreboard players set $player_xp isc.tmp 0
execute store result score $player_xp isc.tmp run xp query @p[distance=..10,tag=isc.shop.tmp] levels

execute if score @s isc.shop.value > $player_xp isc.tmp run return run scoreboard players set $shop.result isc.tmp 1


# Take player's currency
scoreboard players operation $iter isc.tmp = @s isc.shop.value
execute as @p[distance=..10,tag=isc.shop.tmp] run function isc:as_player/events/shop_right_click/for_level


# Get item data
data remove storage isc:tmp item
execute on passengers as @s[tag=isc.shop.item] run data modify storage isc:tmp item set from entity @s item


# Give item to player
setblock ~ ~ ~ minecraft:yellow_shulker_box destroy
data modify block ~ ~ ~ Items append from storage isc:tmp item
loot give @p[distance=..10,tag=isc.shop.tmp] mine ~ ~ ~ minecraft:stone[minecraft:custom_data={drop_contents:1b}]
setblock ~ ~ ~ minecraft:air replace


# Complete
function isc:as_shop/remove
particle minecraft:happy_villager ~ ~.3 ~ .1 .1 .1 1 5 normal @a
scoreboard players set $shop.result isc.tmp 2
