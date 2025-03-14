#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.poison_dart
scoreboard players add @s spellcrafter.weight 1


# Base stats
scoreboard players add @s spellcrafter.speed 8
scoreboard players add @s spellcrafter.range 40
scoreboard players add @s spellcrafter.damage 2


# Effects
playsound minecraft:entity.splash_potion.throw player @a ^ ^ ^2 2 1.25
