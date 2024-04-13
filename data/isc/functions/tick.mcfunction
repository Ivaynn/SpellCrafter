#> executed by #minecraft:tick


# Tag spectators
tag @a[gamemode=spectator] add isc.spectator
tag @a[gamemode=!spectator] remove isc.spectator


# Tick functions for different types of entities
execute as @a[gamemode=!spectator] at @s run function isc:as_player/tick
execute as @e[type=minecraft:marker,tag=isc.projectile] at @s run function isc:as_projectile/tick
execute as @e[type=#isc:caster,type=!minecraft:player,tag=isc.caster] at @s run function isc:as_caster/nonplayer/tick
execute as @e[type=#isc:summon,tag=isc.summon] at @s run function isc:as_summon/tick
execute as @e[type=minecraft:marker,tag=isc.table] at @s run function isc:as_table/tick
