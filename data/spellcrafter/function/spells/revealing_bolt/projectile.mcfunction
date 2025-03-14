#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.revealing_bolt


# Base stats
scoreboard players add @s spellcrafter.speed 2
scoreboard players add @s spellcrafter.range 75
scoreboard players add @s spellcrafter.damage 0


# Effects
playsound minecraft:entity.glow_squid.ambient player @a ^ ^ ^2 2 1.5
