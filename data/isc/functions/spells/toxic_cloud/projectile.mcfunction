#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.toxic_cloud
tag @s add isc.spell.piercing
tag @s add isc.spell.ghost


# Base stats
scoreboard players add @s isc.speed 0
scoreboard players add @s isc.range 60
scoreboard players add @s isc.damage 0


# Effects
playsound minecraft:entity.splash_potion.break player @a ~ ~ ~ 1 1.8
