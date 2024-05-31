#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.healing_circle
tag @s add isc.spell.piercing
tag @s add isc.spell.ghost


# Base stats
scoreboard players add @s isc.speed 0
scoreboard players add @s isc.range 100
scoreboard players add @s isc.damage 0


# Effects
playsound minecraft:block.brewing_stand.brew player @a ~ ~ ~ 1 1.4
