#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.dist
scoreboard players operation $rem spellcrafter.tmp %= #20 spellcrafter.math

execute if score $rem spellcrafter.tmp matches 1.. run return 0


# Generate random rotation offset
execute store result score $offset_r0 spellcrafter.tmp run random value -10..10
execute store result score $offset_r1 spellcrafter.tmp run random value -10..10


# Get current rotation
execute store result score $r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 spellcrafter.tmp run data get entity @s Rotation[1] 1


# Apply offset
scoreboard players operation $r0 spellcrafter.tmp += $offset_r0 spellcrafter.tmp
scoreboard players operation $r1 spellcrafter.tmp += $offset_r1 spellcrafter.tmp


# Save new rotation
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 spellcrafter.tmp
