#> as interaction entity, at player


# Check if this is the correct entity
scoreboard players set $shop.this isc.tmp 0
execute on attacker if entity @s[tag=isc.shop.tmp] run scoreboard players set $shop.this isc.tmp 1
data remove entity @s attack
execute if score $shop.this isc.tmp matches 0 run return 0


#
execute at @s run particle angry_villager ~ ~1 ~ 0 0 0 0 0 force @a
