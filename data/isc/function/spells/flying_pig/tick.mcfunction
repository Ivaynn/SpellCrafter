#> [tick] as pig


# Check if this entity has passengers + get their rotation & motion
execute unless data entity @s {HurtTime:0s} run return run playsound minecraft:entity.pig.death player @a ~ ~ ~ 1 1

scoreboard players set $has_rider isc.tmp 0
execute on passengers run function isc:spells/flying_pig/as_rider
execute if score $has_rider isc.tmp matches 0 run return 0


# Effects
execute if score @s isc.age matches 6.. at @s run particle minecraft:heart ~ ~1 ~ .5 .5 .5 1 5 normal @a
execute if score @s isc.age matches 6.. run data merge entity @s {NoAI:0b,NoGravity:0b,Invulnerable:0b}
scoreboard players set @s isc.age 5
particle minecraft:cloud ~ ~.5 ~ 0 0 0 0.01 1 normal @a


# Fly
data merge entity @s {FallDistance:0.0f}
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp

# Fly down
execute if score $mx isc.tmp matches 0 if score $mz isc.tmp matches 0 run return run data modify entity @s Motion[1] set value -0.15d

# Fly up
execute store result entity @s Motion[0] double 0.015 run scoreboard players get $mx isc.tmp
execute store result entity @s Motion[2] double 0.015 run scoreboard players get $mz isc.tmp
data modify entity @s Motion[1] set value 0.1d
