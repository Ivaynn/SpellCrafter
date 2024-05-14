#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.shulker_bullet
tag @s add isc.spell.homing


# Base stats
scoreboard players add @s isc.speed 2
scoreboard players add @s isc.range 40
scoreboard players add @s isc.damage 2


# Effects
playsound minecraft:entity.shulker.shoot player @a ^ ^ ^3 2 1.2
