#> execute summon (target_dummy), at @s

tag @s add isc.target_dummy

data merge entity @s {PersistenceRequired:1b,PlayerCreated:1b,Health:500.0f,attributes:[{id:"minecraft:generic.max_health",base:500},{id:"minecraft:generic.movement_speed",base:-100}]}
