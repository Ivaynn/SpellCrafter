#> execute summon (target_dummy), at @s

attribute @s minecraft:max_health base set 1024
attribute @s minecraft:scale base set 2.0

tag @s add spellcrafter.target_dummy

data merge entity @s {CustomName:{"text":"Target Dummy","color":"aqua"},CustomNameVisible:0b,PersistenceRequired:1b,NoAI:1b,Silent:1b,Health:1024.0f,CanDuplicate:0b}
execute positioned ~ ~-1.2 ~ rotated as @p[distance=..0.001] run tp @s ~ ~1.2 ~ ~ 0
