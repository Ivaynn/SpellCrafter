#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/add


# Effects
particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.1 15 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.6
