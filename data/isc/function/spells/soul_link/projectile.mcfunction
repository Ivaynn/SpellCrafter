#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.soul_link


# Base stats
scoreboard players add @s isc.speed 20
scoreboard players add @s isc.range 50
scoreboard players add @s isc.damage 12


# Effects
playsound minecraft:entity.vex.death player @a ^ ^ ^3 2 0.8
