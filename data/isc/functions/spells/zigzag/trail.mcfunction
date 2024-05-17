#> as projectile, at @s

scoreboard players operation $rem isc.tmp = @s isc.dist
scoreboard players add $rem isc.tmp 8
scoreboard players operation $rem isc.tmp %= #32 isc.math


execute if score $rem isc.tmp matches 0..15 at @s run tp @s ^0.2 ^ ^
execute if score $rem isc.tmp matches 16..31 at @s run tp @s ^-0.2 ^ ^
