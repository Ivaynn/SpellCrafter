#> executed by #minecraft:tick
scoreboard players set #in_tick isc.tmp 1

# Tag spectators
tag @a[gamemode=spectator] add isc.spectator
tag @a[gamemode=!spectator] remove isc.spectator


scoreboard players set $projectile_count isc.tmp 0


# Tick functions for different types of entities
execute as @a[gamemode=!spectator] at @s run function isc:as_player/tick
execute as @e[type=minecraft:marker,tag=isc.projectile] at @s run function isc:as_projectile/tick
execute as @e[type=#isc:caster,type=!minecraft:player,tag=isc.caster] at @s run function isc:as_caster/nonplayer/tick
execute as @e[type=#isc:summon,tag=isc.summon] at @s run function isc:as_summon/tick
execute as @e[type=minecraft:block_display,tag=isc.table] at @s run function isc:as_table/tick


# Projectile cap
execute if score $projectile_count isc.tmp >= projectile_cap isc.options run function isc:clear_projectiles

scoreboard players set #in_tick isc.tmp 0
