#> execute summon (target_dummy), at @s

tag @s add spellcrafter.target_dummy

data merge entity @s {PersistenceRequired:1b,PlayerCreated:1b,Health:500.0f,attributes:[{id:"minecraft:max_health",base:500},{id:"minecraft:movement_speed",base:-100}]}
