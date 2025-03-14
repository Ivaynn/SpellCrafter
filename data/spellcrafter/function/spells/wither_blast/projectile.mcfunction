#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.wither_blast


# Base stats
scoreboard players add @s spellcrafter.speed 5
scoreboard players add @s spellcrafter.range 50
scoreboard players add @s spellcrafter.damage 8


# Effects
playsound minecraft:entity.wither.shoot player @a ^ ^ ^2 2 1.0
