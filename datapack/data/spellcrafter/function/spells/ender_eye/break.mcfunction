#> as summon, at @s

playsound minecraft:entity.ender_eye.death player @a[distance=..100] ~ ~ ~ 1 0.8

execute if data entity @s {item:{id:"minecraft:ender_eye"}} run particle minecraft:item{item:{id:"minecraft:ender_eye"}} ~ ~ ~ 0.2 0.2 0.2 0.2 10 normal @a[distance=..100]
execute if data entity @s {item:{id:"minecraft:ender_pearl"}} run particle minecraft:item{item:{id:"minecraft:ender_pearl"}} ~ ~ ~ 0.2 0.2 0.2 0.2 10 normal @a[distance=..100]

kill @s[type=!minecraft:player]
