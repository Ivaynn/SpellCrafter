#> any

execute store result score $count isc.tmp run kill @e[type=minecraft:marker,tag=isc.projectile]
tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Projectile cap reached! Removed all ","color":"gray"},{"score":{"name":"$count","objective":"isc.tmp"},"color":"gray"},{"text":" projectiles","color":"gray"}]
