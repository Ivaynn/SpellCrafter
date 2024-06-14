#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.boomerang
tag @s add isc.spell.return
tag @s add isc.spell.piercing


# Base stats
scoreboard players add @s isc.speed 10
scoreboard players add @s isc.range 55
scoreboard players add @s isc.damage 10


# Effects
playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 2 1.6
