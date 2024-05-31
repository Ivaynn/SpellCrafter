#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.arcane_shield
tag @s add isc.spell.piercing
tag @s add isc.spell.ghost


# Base stats
scoreboard players add @s isc.speed 0
scoreboard players add @s isc.range 100
scoreboard players add @s isc.damage 0


# Effects
playsound minecraft:entity.iron_golem.repair player @a ~ ~ ~ 1 0.8
