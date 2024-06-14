#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.magic_missile


# Base stats
scoreboard players add @s isc.speed 8
scoreboard players add @s isc.range 25
scoreboard players add @s isc.damage 4


# Effects
playsound minecraft:entity.illusioner.cast_spell player @a ^ ^ ^3 2 1.5
