#> [tick] as projectile, at @s

scoreboard players operation $rem isc.tmp = @s isc.tick
scoreboard players operation $rem isc.tmp %= #5 isc.math

execute unless score $rem isc.tmp matches 4 run return 0


scoreboard players operation $speed isc.tmp = @s isc.speed
execute if score $speed isc.tmp matches ..-1 run scoreboard players operation $speed isc.tmp *= #n1 isc.math

execute if score $speed isc.tmp matches 1..3 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.3
execute if score $speed isc.tmp matches 4..6 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.4
execute if score $speed isc.tmp matches 7..9 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.5
execute if score $speed isc.tmp matches 10..12 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.6
execute if score $speed isc.tmp matches 13..19 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.7
