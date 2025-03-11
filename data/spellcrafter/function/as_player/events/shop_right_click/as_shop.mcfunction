#> as interaction entity, at player


# Check if this is the correct entity
scoreboard players set $shop.this spellcrafter.tmp 0
execute on target if entity @s[tag=spellcrafter.shop.tmp] run scoreboard players set $shop.this spellcrafter.tmp 1
data remove entity @s interaction
execute if score $shop.this spellcrafter.tmp matches 0 run return 0


# Check if this is the correct player
execute if score @s spellcrafter.id matches 1.. unless score @p[distance=..0.001,tag=spellcrafter.shop.tmp] spellcrafter.id = @s spellcrafter.id run return run scoreboard players set $shop.result spellcrafter.tmp 2


# Check if player has enough currency to buy the item
scoreboard players set $player_xp spellcrafter.tmp 0
execute store result score $player_xp spellcrafter.tmp run xp query @p[distance=..0.001,tag=spellcrafter.shop.tmp] levels

execute if score @s spellcrafter.shop.value > $player_xp spellcrafter.tmp run return run scoreboard players set $shop.result spellcrafter.tmp 1


# Take player's xp
scoreboard players operation $iter spellcrafter.tmp = @s spellcrafter.shop.value
execute as @p[distance=..0.001,tag=spellcrafter.shop.tmp] run function spellcrafter:as_player/events/shop_right_click/for_level


# Get item data
data remove storage spellcrafter:tmp item
execute on passengers as @s[tag=spellcrafter.shop.item] run data modify storage spellcrafter:tmp item set from entity @s item


# Give item to player
execute as @p[distance=..0.001,tag=spellcrafter.shop.tmp] at @s anchored eyes positioned ^ ^-0.25 ^-0.25 run function spellcrafter:as_player/events/shop_right_click/summon_item


# Shop uses
scoreboard players remove @s spellcrafter.shop.uses 1
execute unless score @s spellcrafter.shop.uses matches 1.. run function spellcrafter:as_shop/remove


# Complete
execute at @s run particle minecraft:happy_villager ~ ~.3 ~ .15 .15 .15 1 5 normal
scoreboard players set $shop.result spellcrafter.tmp 3
