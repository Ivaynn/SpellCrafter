#> as projectile, at @s

scoreboard players operation $dir isc.tmp = @s isc.dist
scoreboard players remove $dir isc.tmp 1
scoreboard players operation $dir isc.tmp %= #16 isc.math

execute if score $dir isc.tmp matches 4 if score @s isc.dist matches 5..8 at @s run tp @s ^ ^-0.424 ^
execute if score $dir isc.tmp matches 5 if score @s isc.dist matches 5..8 at @s run tp @s ^ ^-0.344 ^
execute if score $dir isc.tmp matches 6 if score @s isc.dist matches 5..8 at @s run tp @s ^ ^-0.228 ^
execute if score $dir isc.tmp matches 7 if score @s isc.dist matches 5..8 at @s run tp @s ^ ^-0.082 ^

execute if score @s isc.dist matches 8.. at @s run function isc:spells/spiral/free
