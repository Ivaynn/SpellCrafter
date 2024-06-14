#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.revealing_bolt


# Base stats
scoreboard players add @s isc.speed 2
scoreboard players add @s isc.range 75
scoreboard players add @s isc.damage 0


# Effects
playsound minecraft:entity.glow_squid.ambient player @a ^ ^ ^3 2 1.5
