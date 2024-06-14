#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.freezing_bolt


# Base stats
scoreboard players add @s isc.speed 7
scoreboard players add @s isc.range 15
scoreboard players add @s isc.damage 4


# Effects
playsound minecraft:entity.snow_golem.hurt player @a ^ ^ ^3 2 0.8
