#> as new projectile, at @s

# Get data from the original projectile
data modify entity @s Tags set from storage spellcrafter:tmp copy.tags

scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
scoreboard players operation @s spellcrafter.age = $age spellcrafter.tmp
scoreboard players operation @s spellcrafter.speed = $speed spellcrafter.tmp
scoreboard players operation @s spellcrafter.damage = $damage spellcrafter.tmp
scoreboard players operation @s spellcrafter.dist = $dist spellcrafter.tmp
scoreboard players operation @s spellcrafter.blind = $blind spellcrafter.tmp


# Prevent infinite recursion and reduce age
tag @s add spellcrafter.spell.lightning_bolt.branch
execute store result score $tmp.random spellcrafter.tmp run random value 2..4
scoreboard players operation @s spellcrafter.age /= $tmp.random spellcrafter.tmp


# Generate random rotation offset
execute store result score $offset_r0 spellcrafter.tmp run random value -35..35
execute store result score $offset_r1 spellcrafter.tmp run random value -35..35

execute store result score $r0 spellcrafter.tmp run data get storage spellcrafter:tmp copy.rotation[0] 1
execute store result score $r1 spellcrafter.tmp run data get storage spellcrafter:tmp copy.rotation[1] 1

scoreboard players operation $r0 spellcrafter.tmp += $offset_r0 spellcrafter.tmp
scoreboard players operation $r1 spellcrafter.tmp += $offset_r1 spellcrafter.tmp

execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 spellcrafter.tmp
