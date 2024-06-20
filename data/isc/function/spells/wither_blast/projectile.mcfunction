#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.wither_blast


# Base stats
scoreboard players add @s isc.speed 5
scoreboard players add @s isc.range 50
scoreboard players add @s isc.damage 8


# Effects
playsound minecraft:entity.wither.shoot player @a ^ ^ ^3 2 1.0
