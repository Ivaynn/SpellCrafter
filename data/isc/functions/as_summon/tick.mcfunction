#> [tick] as summoned entity, at @s


# Invulnerability timer
execute if score @s isc.cooldown matches 1.. run scoreboard players remove @s isc.cooldown 1
execute if score @s isc.cooldown matches 1 run data modify entity @s Invulnerable set value 0b


# Tick
execute as @s[type=minecraft:goat] at @s run function isc:spells/angry_goat/tick


# Despawn timer
scoreboard players remove @s isc.age 1
execute unless score @s isc.age matches 1.. at @s run function isc:as_summon/timeout
