#> as projectile, on summon, at @s

execute as @e[distance=..15,type=minecraft:marker,tag=isc.projectile] run scoreboard players operation @s isc.id = $id isc.tmp
playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 2 1.2
