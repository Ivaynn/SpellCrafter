#> [tick] as pig


# Check if this entity has passengers + get their rotation
scoreboard players set $has_rider isc.tmp 0
execute on passengers run function isc:spells/flying_pig/as_rider
execute if score $has_rider isc.tmp matches 0 run return 0


# Get rider's rotation
execute if score @s isc.age matches 6.. at @s run particle minecraft:heart ~ ~1 ~ .5 .5 .5 1 5 normal @a
execute if score @s isc.age matches 6.. run data merge entity @s {NoAI:1b,NoGravity:1b}

scoreboard players set @s isc.age 5
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp


# Fly
execute anchored eyes if block ^.1 ^.1 ^.25 #isc:air if block ^.1 ^-.1 ^.25 #isc:air if block ^-.1 ^.1 ^.25 #isc:air if block ^-.1 ^-.1 ^.25 #isc:air anchored feet run tp @s ^ ^ ^.25
particle minecraft:cloud ~ ~.5 ~ 0 0 0 0.01 1 normal @a