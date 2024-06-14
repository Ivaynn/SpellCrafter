#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.poison_dart
scoreboard players add @s isc.weight 1


# Base stats
scoreboard players add @s isc.speed 8
scoreboard players add @s isc.range 40
scoreboard players add @s isc.damage 2


# Effects
playsound minecraft:entity.splash_potion.throw player @a ^ ^ ^3 2 1.25
