#> as projectile, at @s
# projectile hit


# Damage target (scaling with speed)
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $blind isc.tmp = @s isc.blind

scoreboard players set $damage isc.tmp 0
scoreboard players operation $damage isc.tmp = @s isc.speed
scoreboard players operation $damage isc.tmp += @s isc.damage

scoreboard players set $success isc.tmp 0
execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] store result score $success isc.tmp run function isc:damage/add
execute if score $success isc.tmp matches 0 run return 0


# Effects
execute if score @s isc.speed matches 4..7 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 2
execute if score @s isc.speed matches 8..11 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.8
execute if score @s isc.speed matches 12..15 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.6
execute if score @s isc.speed matches 16..19 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.4
execute if score @s isc.speed matches 20..23 run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2.5 1.2
execute if score @s isc.speed matches 24.. run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.0
