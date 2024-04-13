#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.laser


# Base stats
scoreboard players add @s isc.speed 999
scoreboard players add @s isc.range 5
scoreboard players add @s isc.damage 8


# Effects
playsound minecraft:block.beacon.activate player @a ^ ^ ^3 2 2
