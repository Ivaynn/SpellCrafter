
tag @a[gamemode=spectator] add isc.spectator
tag @a[gamemode=!spectator] remove isc.spectator

execute as @a[gamemode=!spectator] at @s run function isc:as_player/tick
execute as @e[type=minecraft:marker,tag=isc.projectile] at @s run function isc:as_projectile/tick
execute as @e[type=#isc:caster,type=!minecraft:player,tag=isc.caster] at @s run function isc:as_caster/tick


execute as @e[type=#isc:summon,tag=isc.summon] run function isc:as_summon/tick
