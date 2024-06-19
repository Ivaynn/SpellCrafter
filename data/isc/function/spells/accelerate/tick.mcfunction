#> as projectile, at @s

scoreboard players operation $rem isc.tmp = @s isc.tick
scoreboard players operation $rem isc.tmp %= #5 isc.math
execute unless score $rem isc.tmp matches 0 run return 0

scoreboard players operation @s isc.speed *= #2 isc.math

execute if score @s isc.speed matches 0 run scoreboard players add @s isc.speed 1
execute if score @s isc.speed matches 1001.. run scoreboard players set @s isc.speed 1000
execute if score @s isc.speed matches ..-1001 run scoreboard players set @s isc.speed -1000
