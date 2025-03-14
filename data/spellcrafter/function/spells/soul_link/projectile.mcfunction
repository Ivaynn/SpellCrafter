#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.soul_link


# Base stats
scoreboard players add @s spellcrafter.speed 20
scoreboard players add @s spellcrafter.range 50
scoreboard players add @s spellcrafter.damage 12


# Effects
playsound minecraft:entity.vex.death player @a ^ ^ ^2 2 0.8
