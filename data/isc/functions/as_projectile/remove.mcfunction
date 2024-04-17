#> as projectile

execute at @s run playsound minecraft:entity.generic.extinguish_fire player @a ~ ~ ~ 1 1.5
execute at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.06 10 normal @a
scoreboard players set @s isc.age 0

tag @s add isc.kill
kill @s[tag=isc.projectile]
