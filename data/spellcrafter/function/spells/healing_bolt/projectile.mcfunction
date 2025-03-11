#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.healing_bolt


# Base stats
scoreboard players add @s spellcrafter.speed 10
scoreboard players add @s spellcrafter.range 15
scoreboard players add @s spellcrafter.damage 0


# Effects
playsound minecraft:entity.breeze.jump player @a ^ ^ ^3 2 1.4
