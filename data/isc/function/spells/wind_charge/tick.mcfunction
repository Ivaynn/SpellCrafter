#> [tick] as wind_charge

scoreboard players operation $rem isc.tmp = @s isc.age
scoreboard players operation $rem isc.tmp %= #2 isc.math
execute store result entity @s Air double 1 run scoreboard players get $rem isc.tmp
