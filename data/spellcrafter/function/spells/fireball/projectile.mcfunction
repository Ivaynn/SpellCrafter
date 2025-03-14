#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.fireball


# Base stats
scoreboard players add @s spellcrafter.speed 3
scoreboard players add @s spellcrafter.range 10
scoreboard players add @s spellcrafter.damage 6


# Effects
playsound minecraft:item.firecharge.use player @a ^ ^ ^2 2 1.2
