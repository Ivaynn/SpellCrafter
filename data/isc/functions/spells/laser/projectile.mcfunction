#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.laser
tag @s add isc.spell.instant
tag @s add isc.spell.piercing


# Base stats
scoreboard players add @s isc.range 5
scoreboard players add @s isc.damage 8


# Effects
playsound minecraft:block.beacon.activate player @a ^ ^ ^3 2 2
