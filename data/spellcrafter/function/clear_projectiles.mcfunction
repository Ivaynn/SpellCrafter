#> any

execute store result score $count spellcrafter.tmp run kill @e[type=minecraft:marker,tag=spellcrafter.projectile]
execute if score warnings spellcrafter.options matches 1 run tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Projectile cap reached! Removed all ","color":"gray"},{"score":{"name":"$count","objective":"spellcrafter.tmp"},"color":"gray"},{"text":" projectiles","color":"gray"}]
