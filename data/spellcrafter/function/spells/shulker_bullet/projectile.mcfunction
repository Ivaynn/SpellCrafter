#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.shulker_bullet
tag @s add spellcrafter.spell.homing


# Base stats
scoreboard players add @s spellcrafter.speed 1
scoreboard players add @s spellcrafter.range 40
scoreboard players add @s spellcrafter.damage 2


# Effects
playsound minecraft:entity.shulker.shoot player @a ^ ^ ^3 2 1.2
