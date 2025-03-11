#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.toxic_cloud
tag @s add spellcrafter.spell.piercing
tag @s add spellcrafter.spell.ghost


# Base stats
scoreboard players add @s spellcrafter.speed 0
scoreboard players add @s spellcrafter.range 60
scoreboard players add @s spellcrafter.damage 0


# Effects
playsound minecraft:entity.splash_potion.break player @a ~ ~ ~ 1 1.8
