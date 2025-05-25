#> [tick] as projectile, at @s


# Checks
execute if score @s spellcrafter.weight matches 0 run return 0


# Get current rotation
execute store result score $r1 spellcrafter.tmp run data get entity @s Rotation[1] 1


# Apply offset
scoreboard players operation $r1 spellcrafter.tmp += @s spellcrafter.weight


# Save new rotation
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 spellcrafter.tmp
