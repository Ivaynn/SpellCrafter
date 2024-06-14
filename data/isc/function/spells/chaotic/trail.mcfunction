#> as projectile, at @s

scoreboard players operation $rem isc.tmp = @s isc.dist
scoreboard players operation $rem isc.tmp %= #20 isc.math

execute if score $rem isc.tmp matches 1.. run return 0


# Generate random rotation offset
execute store result score $offset_r0 isc.tmp run random value -10..10
execute store result score $offset_r1 isc.tmp run random value -10..10


# Get current rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1


# Apply offset
scoreboard players operation $r0 isc.tmp += $offset_r0 isc.tmp
scoreboard players operation $r1 isc.tmp += $offset_r1 isc.tmp


# Save new rotation
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp
