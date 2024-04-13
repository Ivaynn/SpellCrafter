#> as projectile, at @s

particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 0 force @a


# Damage targets along the way
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..2,type=!#isc:untargetable] run function isc:damage/init
