#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.arcane_reaper


# Base stats
scoreboard players add @s isc.speed 1
scoreboard players add @s isc.range 5
scoreboard players add @s isc.damage 2


# Effects
playsound minecraft:entity.evoker.prepare_summon player @a ^ ^ ^3 2 1.5
