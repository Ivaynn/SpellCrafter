#> as projectile, at @s

# Save initial rotation
execute store result score $r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 spellcrafter.tmp run data get entity @s Rotation[1] 1
scoreboard players operation $r0_start spellcrafter.tmp = $r0 spellcrafter.tmp
scoreboard players operation $r1_start spellcrafter.tmp = $r1 spellcrafter.tmp


# Change rotation to bounce
execute unless block ~.3 ~ ~ #spellcrafter:air run scoreboard players operation $r0 spellcrafter.tmp *= #n1 spellcrafter.math
execute unless block ~-.3 ~ ~ #spellcrafter:air run scoreboard players operation $r0 spellcrafter.tmp *= #n1 spellcrafter.math
execute unless block ~ ~ ~.3 #spellcrafter:air run function spellcrafter:spells/bouncy/hit_ns
execute unless block ~ ~ ~-.3 #spellcrafter:air run function spellcrafter:spells/bouncy/hit_ns
execute unless block ~ ~.3 ~ #spellcrafter:air run scoreboard players operation $r1 spellcrafter.tmp *= #n1 spellcrafter.math
execute unless block ~ ~-.3 ~ #spellcrafter:air run scoreboard players operation $r1 spellcrafter.tmp *= #n1 spellcrafter.math


# If rotation didn't change, the projectile is stuck. Stop it here
execute if score $r0 spellcrafter.tmp = $r0_start spellcrafter.tmp if score $r1 spellcrafter.tmp = $r1_start spellcrafter.tmp run return run scoreboard players set @s spellcrafter.age 0


# Save
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 spellcrafter.tmp
