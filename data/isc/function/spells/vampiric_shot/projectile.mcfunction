#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.vampiric_shot


# Base stats
scoreboard players add @s isc.speed 10
scoreboard players add @s isc.range 15
scoreboard players add @s isc.damage 4


# Effects
playsound minecraft:entity.phantom.hurt player @a ^ ^ ^3 2 0.7
