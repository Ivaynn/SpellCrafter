#> as projectile, on summon, at @s


# Generate random rotation offset
execute store result score $offset_r0 isc.tmp run random value -20..20
execute store result score $offset_r1 isc.tmp run random value -20..20


# Get current rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1


# Apply offset
scoreboard players operation $r0 isc.tmp += $offset_r0 isc.tmp
scoreboard players operation $r1 isc.tmp += $offset_r1 isc.tmp


# Save new rotation
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp
