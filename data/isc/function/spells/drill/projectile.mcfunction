#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.drill
tag @s add isc.spell.ghost


# Base stats
scoreboard players add @s isc.speed 1
scoreboard players add @s isc.range 5
scoreboard players add @s isc.damage 4


# Effects
playsound minecraft:block.lever.click player @a ^ ^ ^3 2 0.7
