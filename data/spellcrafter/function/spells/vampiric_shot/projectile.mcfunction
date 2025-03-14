#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.vampiric_shot


# Base stats
scoreboard players add @s spellcrafter.speed 10
scoreboard players add @s spellcrafter.range 15
scoreboard players add @s spellcrafter.damage 4


# Effects
playsound minecraft:entity.phantom.hurt player @a ^ ^ ^2 2 0.7
