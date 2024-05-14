#> as projectile, on summon, at @s

tag @s add isc.spell.chaotic

execute store result score $random isc.tmp run random value -15..30
scoreboard players operation @s isc.range += $random isc.tmp

execute store result score $random isc.tmp run random value -5..10
scoreboard players operation @s isc.speed += $random isc.tmp

return 1
