#> as projectile, at @s
# projectile hit


# Damage target (scaling with speed)
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $blind isc.tmp = @s isc.blind

scoreboard players set $damage isc.tmp 0
scoreboard players operation $damage isc.tmp = @s isc.speed
scoreboard players operation $damage isc.tmp /= #2 isc.math
scoreboard players operation $damage isc.tmp += @s isc.damage
execute as @s[tag=isc.spell.instant] run scoreboard players set $damage isc.tmp 50
execute if score $damage isc.tmp matches 51.. run scoreboard players set $damage isc.tmp 50

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/init


# Effects
execute if score @s isc.speed matches 30.. run particle minecraft:explosion ^ ^ ^ 0 0 0 0 0 force @a

execute if score @s isc.speed matches 9.. run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 2
execute if score @s isc.speed matches 10..19 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.9
execute if score @s isc.speed matches 20..29 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.8
execute if score @s isc.speed matches 30..39 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.7
execute if score @s isc.speed matches 40..49 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.6
execute if score @s isc.speed matches 50.. run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.5
