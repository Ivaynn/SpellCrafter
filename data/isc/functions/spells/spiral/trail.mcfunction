#> as projectile, at @s

scoreboard players operation $dir isc.tmp = @s isc.dist
scoreboard players remove $dir isc.tmp 1
scoreboard players operation $dir isc.tmp %= #16 isc.math

execute if score $dir isc.tmp matches 0 if score @s isc.dist matches ..4 at @s run tp @s ^ ^-0.424 ^
execute if score $dir isc.tmp matches 1 if score @s isc.dist matches ..4 at @s run tp @s ^ ^-0.344 ^
execute if score $dir isc.tmp matches 2 if score @s isc.dist matches ..4 at @s run tp @s ^ ^-0.228 ^
execute if score $dir isc.tmp matches 3 if score @s isc.dist matches ..4 at @s run tp @s ^ ^-0.082 ^

execute if score $dir isc.tmp matches 0 if score @s isc.dist matches 5.. at @s run tp @s ^0.082 ^-0.424 ^
execute if score $dir isc.tmp matches 1 if score @s isc.dist matches 5.. at @s run tp @s ^0.228 ^-0.344 ^
execute if score $dir isc.tmp matches 2 if score @s isc.dist matches 5.. at @s run tp @s ^0.344 ^-0.228 ^
execute if score $dir isc.tmp matches 3 if score @s isc.dist matches 5.. at @s run tp @s ^0.424 ^-0.082 ^

execute if score $dir isc.tmp matches 4 at @s run tp @s ^0.424 ^0.082 ^
execute if score $dir isc.tmp matches 5 at @s run tp @s ^0.344 ^0.228 ^
execute if score $dir isc.tmp matches 6 at @s run tp @s ^0.228 ^0.344 ^
execute if score $dir isc.tmp matches 7 at @s run tp @s ^0.082 ^0.424 ^

execute if score $dir isc.tmp matches 8 at @s run tp @s ^-0.082 ^0.424 ^
execute if score $dir isc.tmp matches 9 at @s run tp @s ^-0.228 ^0.344 ^
execute if score $dir isc.tmp matches 10 at @s run tp @s ^-0.344 ^0.228 ^
execute if score $dir isc.tmp matches 11 at @s run tp @s ^-0.424 ^0.082 ^

execute if score $dir isc.tmp matches 12 at @s run tp @s ^-0.424 ^-0.082 ^
execute if score $dir isc.tmp matches 13 at @s run tp @s ^-0.344 ^-0.228 ^
execute if score $dir isc.tmp matches 14 at @s run tp @s ^-0.228 ^-0.344 ^
execute if score $dir isc.tmp matches 15 at @s run tp @s ^-0.082 ^-0.424 ^
