#> as interaction entity, at player


# Check if this is the correct entity
scoreboard players set $shop.this isc.tmp 0
execute on target if entity @s[tag=isc.shop.tmp] run scoreboard players set $shop.this isc.tmp 1
data remove entity @s interaction
execute if score $shop.this isc.tmp matches 0 run return 0


#
execute at @s run particle happy_villager ~ ~1.5 ~ 0 0 0 0 0 force @a
