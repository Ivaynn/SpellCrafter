#> as projectile, on summon, at @s

execute store result score $random spellcrafter.tmp run random value -15..30
scoreboard players operation @s spellcrafter.range += $random spellcrafter.tmp

execute store result score $random spellcrafter.tmp run random value -5..10
scoreboard players operation @s spellcrafter.speed += $random spellcrafter.tmp
