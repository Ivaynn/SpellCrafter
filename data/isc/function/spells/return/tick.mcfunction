#> as projectile, at @s

scoreboard players operation $rem isc.tmp = @s isc.tick
scoreboard players operation $rem isc.tmp %= #2 isc.math

execute if score $rem isc.tmp matches 0 run scoreboard players remove @s isc.speed 1
