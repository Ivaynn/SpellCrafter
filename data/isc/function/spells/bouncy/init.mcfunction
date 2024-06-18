#> as projectile, at @s

# Save initial rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1
scoreboard players operation $r0_start isc.tmp = $r0 isc.tmp
scoreboard players operation $r1_start isc.tmp = $r1 isc.tmp


# Change rotation to bounce
execute unless block ~.3 ~ ~ #isc:air run scoreboard players operation $r0 isc.tmp *= #n1 isc.math
execute unless block ~-.3 ~ ~ #isc:air run scoreboard players operation $r0 isc.tmp *= #n1 isc.math
execute unless block ~ ~ ~.3 #isc:air run function isc:spells/bouncy/hit_ns
execute unless block ~ ~ ~-.3 #isc:air run function isc:spells/bouncy/hit_ns
execute unless block ~ ~.3 ~ #isc:air run scoreboard players operation $r1 isc.tmp *= #n1 isc.math
execute unless block ~ ~-.3 ~ #isc:air run scoreboard players operation $r1 isc.tmp *= #n1 isc.math


# If rotation didn't change, the projectile is stuck. Stop it here
execute if score $r0 isc.tmp = $r0_start isc.tmp if score $r1 isc.tmp = $r1_start isc.tmp run return run scoreboard players set @s isc.age 0


# Save
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp
