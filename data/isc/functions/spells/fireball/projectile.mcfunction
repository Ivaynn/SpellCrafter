#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.fireball


# Base stats
scoreboard players add @s isc.speed 3
scoreboard players add @s isc.range 15
scoreboard players add @s isc.damage 6


# Effects
playsound minecraft:item.firecharge.use player @a ^ ^ ^3 2 1.2
