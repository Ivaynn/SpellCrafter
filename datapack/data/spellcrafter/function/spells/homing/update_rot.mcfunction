#> [tick] as projectile, at @s (homing)
#> [tick] as projectile, at @s (guide)
#> [tick] as projectile, at @s (follow)
#> [tick] as projectile, at @s (orbit)
# score "$target_r0 spellcrafter.tmp" contains the target yaw rotation
# score "$target_r1 spellcrafter.tmp" contains the target pitch rotation
# score "$turn_speed spellcrafter.tmp" contains the max speed at which this should turn


# Get turn speed or set defaults (+10, -10)
execute unless score $turn_speed spellcrafter.tmp matches 1.. run scoreboard players set $turn_speed spellcrafter.tmp 10
execute unless score $turn_speed spellcrafter.tmp matches ..100 run scoreboard players set $turn_speed spellcrafter.tmp 100
scoreboard players operation $turn_speed_n spellcrafter.tmp = $turn_speed spellcrafter.tmp
scoreboard players operation $turn_speed_n spellcrafter.tmp *= #n1 spellcrafter.math


# Get current rotation
execute store result score $r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 spellcrafter.tmp run data get entity @s Rotation[1] 1


# Vertical rotation
scoreboard players operation $target_r1 spellcrafter.tmp -= $r1 spellcrafter.tmp

execute if score $target_r1 spellcrafter.tmp > $turn_speed spellcrafter.tmp run scoreboard players operation $target_r1 spellcrafter.tmp = $turn_speed spellcrafter.tmp
execute if score $target_r1 spellcrafter.tmp < $turn_speed_n spellcrafter.tmp run scoreboard players operation $target_r1 spellcrafter.tmp = $turn_speed_n spellcrafter.tmp

scoreboard players operation $r1 spellcrafter.tmp += $target_r1 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 spellcrafter.tmp


# Horizontal rotation
scoreboard players operation $target_r0 spellcrafter.tmp -= $r0 spellcrafter.tmp

execute if score $target_r0 spellcrafter.tmp matches ..179 if score $target_r0 spellcrafter.tmp > $turn_speed spellcrafter.tmp run scoreboard players operation $target_r0 spellcrafter.tmp = $turn_speed spellcrafter.tmp
execute if score $target_r0 spellcrafter.tmp matches 180.. run scoreboard players operation $target_r0 spellcrafter.tmp = $turn_speed_n spellcrafter.tmp
execute if score $target_r0 spellcrafter.tmp matches -179.. if score $target_r0 spellcrafter.tmp < $turn_speed_n spellcrafter.tmp run scoreboard players operation $target_r0 spellcrafter.tmp = $turn_speed_n spellcrafter.tmp
execute if score $target_r0 spellcrafter.tmp matches ..-180 run scoreboard players operation $target_r0 spellcrafter.tmp = $turn_speed spellcrafter.tmp

scoreboard players operation $r0 spellcrafter.tmp += $target_r0 spellcrafter.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp
