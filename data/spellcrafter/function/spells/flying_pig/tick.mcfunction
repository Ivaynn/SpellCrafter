#> [tick] as pig


# Check if this entity has passengers + get their rotation & motion
execute unless data entity @s {HurtTime:0s} run return run playsound minecraft:entity.pig.death player @a ~ ~ ~ 1 1

scoreboard players set $has_rider spellcrafter.tmp 0
execute on passengers run function spellcrafter:spells/flying_pig/as_rider
execute if score $has_rider spellcrafter.tmp matches 0 run return 0


# Effects
execute if score @s spellcrafter.age matches 6.. at @s run particle minecraft:heart ~ ~1 ~ .5 .5 .5 1 5 normal @a
execute if score @s spellcrafter.age matches 6.. run data merge entity @s {NoAI:0b,NoGravity:0b,Invulnerable:0b}
scoreboard players set @s spellcrafter.age 5
particle minecraft:cloud ~ ~.5 ~ 0 0 0 0.01 1 normal @a


# Fly
data merge entity @s {FallDistance:0.0f}
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp

# Fly down
execute if score $mx spellcrafter.tmp matches 0 if score $mz spellcrafter.tmp matches 0 run return run data modify entity @s Motion[1] set value -0.15d

# Fly up
execute store result entity @s Motion[0] double 0.015 run scoreboard players get $mx spellcrafter.tmp
execute store result entity @s Motion[2] double 0.015 run scoreboard players get $mz spellcrafter.tmp
data modify entity @s Motion[1] set value 0.1d
