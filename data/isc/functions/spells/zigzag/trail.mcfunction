#> as projectile, at @s

scoreboard players operation $dir isc.tmp = @s isc.dist
scoreboard players add $dir isc.tmp 8
scoreboard players operation $dir isc.tmp %= #32 isc.math


execute if score $dir isc.tmp matches 0 at @s run tp @s ~ ~ ~ ~-90 ~
execute if score $dir isc.tmp matches 16 at @s run tp @s ~ ~ ~ ~90 ~
