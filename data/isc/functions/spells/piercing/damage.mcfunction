#> as projectile, at @s

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute as @s[tag=!isc.spell.laser,tag=!isc.spell.black_hole] run scoreboard players operation $damage isc.tmp /= #2 isc.math
execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..2,type=!#isc:untargetable] run function isc:damage/init
