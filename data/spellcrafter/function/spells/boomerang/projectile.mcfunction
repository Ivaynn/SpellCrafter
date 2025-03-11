#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.boomerang
tag @s add spellcrafter.spell.return
tag @s add spellcrafter.spell.piercing


# Base stats
scoreboard players add @s spellcrafter.speed 10
scoreboard players add @s spellcrafter.range 55
scoreboard players add @s spellcrafter.damage 10


# Effects
playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 2 1.6
