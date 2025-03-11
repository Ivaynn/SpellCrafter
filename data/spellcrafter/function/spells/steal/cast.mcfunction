#> as projectile, on summon, at @s

execute as @e[distance=..15,type=minecraft:marker,tag=spellcrafter.projectile] run scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 2 1.2
