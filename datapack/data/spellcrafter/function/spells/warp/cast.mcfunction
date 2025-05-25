#> as projectile, on summon, at @s

execute at @e[limit=1,distance=0.1..10,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run tp @s ~ ~1 ~
execute if entity @s[distance=..0.001] run return 0

execute at @s run particle minecraft:reverse_portal ~ ~ ~ 0 0 0 0.5 10 force @a
particle minecraft:reverse_portal ~ ~ ~ 0 0 0 .2 10 force @a

playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1.8
