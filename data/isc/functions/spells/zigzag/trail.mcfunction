#> [tick] as projectile, at @s

scoreboard players operation $dir isc.tmp = @s isc.dist
scoreboard players operation $dir isc.tmp %= #40 isc.math


execute if score $dir isc.tmp matches 0 at @s run tp @s ~ ~ ~ ~90 ~
execute if score $dir isc.tmp matches 20 at @s run tp @s ~ ~ ~ ~-90 ~
