#> execute summon (target_dummy), at @s

tag @s add isc.target_dummy

data merge entity @s {PersistenceRequired:1b,PlayerCreated:1b,Health:500.0f,Attributes:[{Name:"minecraft:generic.max_health",Base:500},{Name:"minecraft:generic.movement_speed",Base:-100}]}
