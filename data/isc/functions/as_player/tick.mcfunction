#> [tick] as player, at @s


# Infinite spells mode
execute if score @s isc.inf_page matches 100.. run function isc:as_player/inf_spells/init


# Stop projectiles from hitting spectators
tag @a[gamemode=spectator] add isc.spectator
tag @a[gamemode=!spectator] remove isc.spectator


# All players must have an id
execute unless score @s isc.id matches 1.. run function isc:as_caster/new_id


# Triggers
execute as @a unless score @s isc.toggle matches 0 run function isc:as_player/trigger_toggle
scoreboard players enable @a isc.toggle


# Caster
execute as @s[tag=isc.caster,gamemode=!spectator] run function isc:as_caster/player/tick
