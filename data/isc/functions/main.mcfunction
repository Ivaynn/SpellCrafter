#> executed every tick, if score #tick is 1..
scoreboard players add #tick isc.options 1
scoreboard players set #in_tick isc.tmp 1

# Generic player ticks
tag @a[gamemode=spectator] add isc.spectator
tag @a[gamemode=!spectator] remove isc.spectator
execute unless score @s isc.id matches 1.. run function isc:as_caster/new_id
scoreboard players enable @a isc.toggle
execute as @a unless score @s isc.toggle matches 0 run function isc:as_player/trigger_toggle


# Count projectiles check threshold and avoid lag
scoreboard players set $projectile_count isc.tmp 0


# Tick functions for different types of entities
execute as @a[tag=isc.caster,gamemode=!spectator] at @s run function isc:as_player/tick
execute as @e[type=minecraft:marker,tag=isc.projectile] at @s run function isc:as_projectile/tick
execute as @e[type=#isc:caster,type=!minecraft:player,tag=isc.caster] at @s run function isc:as_caster/nonplayer/tick
execute as @e[type=#isc:summon,tag=isc.summon] at @s run function isc:as_summon/tick
execute as @e[type=minecraft:block_display,tag=isc.table] at @s run function isc:as_table/tick
execute as @e[type=minecraft:iron_golem,tag=isc.target_dummy] at @s run function isc:as_target_dummy/tick


# Projectile cap
execute if score $projectile_count isc.tmp >= projectile_cap isc.options run function isc:clear_projectiles

scoreboard players set #in_tick isc.tmp 0
