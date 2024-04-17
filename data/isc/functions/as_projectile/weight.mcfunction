#> [tick] as projectile, at @s


# Checks
execute if score @s isc.weight matches 0 run return 0


# Get current rotation
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1


# Apply offset
scoreboard players operation $r1 isc.tmp += @s isc.weight


# Save new rotation
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp
