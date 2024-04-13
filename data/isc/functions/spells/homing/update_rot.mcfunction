#> [tick] as projectile, at @s (homing)
#> [tick] as projectile, at @s (guide)


# Get current rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1


# Vertical rotation
scoreboard players operation $target_r1 isc.tmp -= $r1 isc.tmp

execute if score $target_r1 isc.tmp matches 11.. run scoreboard players set $target_r1 isc.tmp 10
execute if score $target_r1 isc.tmp matches ..-11 run scoreboard players set $target_r1 isc.tmp -10

scoreboard players operation $r1 isc.tmp += $target_r1 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp


# Horizontal rotation
scoreboard players operation $target_r0 isc.tmp -= $r0 isc.tmp

execute if score $target_r0 isc.tmp matches 11..179 run scoreboard players set $target_r0 isc.tmp 10
execute if score $target_r0 isc.tmp matches 180.. run scoreboard players set $target_r0 isc.tmp -10
execute if score $target_r0 isc.tmp matches -179..-11 run scoreboard players set $target_r0 isc.tmp -10
execute if score $target_r0 isc.tmp matches ..-180 run scoreboard players set $target_r0 isc.tmp 10

scoreboard players operation $r0 isc.tmp += $target_r0 isc.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
