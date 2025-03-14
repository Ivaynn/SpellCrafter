#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.magic_missile


# Base stats
scoreboard players add @s spellcrafter.speed 8
scoreboard players add @s spellcrafter.range 25
scoreboard players add @s spellcrafter.damage 4


# Effects
playsound minecraft:entity.illusioner.cast_spell player @a ^ ^ ^2 2 1.5
