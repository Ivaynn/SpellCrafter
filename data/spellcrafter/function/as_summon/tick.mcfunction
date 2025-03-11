#> [tick] as summoned entity, at @s


# Invulnerability timer
execute if score @s spellcrafter.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cooldown 1
execute if score @s spellcrafter.cooldown matches 1 run data modify entity @s Invulnerable set value 0b


# Tick
execute as @s[type=minecraft:goat] at @s run function spellcrafter:spells/angry_goat/tick
execute as @s[type=minecraft:pig] at @s run function spellcrafter:spells/flying_pig/tick
execute as @s[type=minecraft:wind_charge] at @s run function spellcrafter:spells/wind_charge/tick


# Despawn timer
scoreboard players remove @s spellcrafter.age 1
execute unless score @s spellcrafter.age matches 1.. at @s run function spellcrafter:as_summon/timeout
