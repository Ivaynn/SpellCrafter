#> [tick] as projectile, at @s

scoreboard players operation $rem isc.tmp = @s isc.tick
scoreboard players operation $rem isc.tmp %= #20 isc.math

execute unless score $rem isc.tmp matches 0 run return 0

execute positioned ~ ~-1 ~ run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.spectator] minecraft:regeneration 2 1 false
