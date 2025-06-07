#> as projectile, on summon, at @s

execute at @e[limit=1,distance=..100,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,tag=!spellcrafter.spectator,predicate=spellcrafter:match_id] run tp @s ~ ~1 ~
execute if entity @s[distance=..0.001] run return 0

execute at @s run particle minecraft:reverse_portal ~ ~ ~ 0 0 0 0.5 10 force @a[distance=..100]
particle minecraft:reverse_portal ~ ~ ~ 0 0 0 .2 10 force @a[distance=..100]

playsound minecraft:entity.enderman.teleport player @a[distance=..100] ~ ~ ~ 1 1.8
