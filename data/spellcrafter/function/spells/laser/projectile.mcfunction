#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.laser
tag @s add spellcrafter.spell.instant
tag @s add spellcrafter.spell.piercing


# Base stats
scoreboard players add @s spellcrafter.range 5
scoreboard players add @s spellcrafter.damage 8
scoreboard players set @s spellcrafter.speed 1000


# Effects
playsound minecraft:block.beacon.activate player @a ^ ^ ^3 2 2
