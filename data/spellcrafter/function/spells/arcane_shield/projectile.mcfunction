#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.arcane_shield
tag @s add spellcrafter.spell.piercing
tag @s add spellcrafter.spell.ghost


# Base stats
scoreboard players add @s spellcrafter.speed 0
scoreboard players add @s spellcrafter.range 100
scoreboard players add @s spellcrafter.damage 0


# Effects
playsound minecraft:entity.iron_golem.repair player @a ~ ~ ~ 1 0.8
