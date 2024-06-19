#> as (other) projectile, at @s

scoreboard players operation $count_diff isc.tmp = @s isc.damage
scoreboard players operation $count_diff isc.tmp *= #5 isc.math
scoreboard players operation $count isc.tmp += $count_diff isc.tmp
particle minecraft:smoke ~ ~ ~ 0 0 0 0.06 10 normal @a
function isc:as_projectile/remove
