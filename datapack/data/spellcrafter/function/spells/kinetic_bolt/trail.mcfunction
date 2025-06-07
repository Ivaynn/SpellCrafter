#> as projectile, at @s

execute if score @s spellcrafter.speed matches ..2 run particle minecraft:firework ~ ~ ~ 0 0 0 0.02 1 force @a[distance=..100]
execute if score @s spellcrafter.speed matches 3..4 run particle minecraft:firework ~ ~ ~ 0 0 0 0.04 1 force @a[distance=..100]
execute if score @s spellcrafter.speed matches 5..6 run particle minecraft:firework ~ ~ ~ 0 0 0 0.06 1 force @a[distance=..100]
execute if score @s spellcrafter.speed matches 7..8 run particle minecraft:firework ~ ~ ~ 0 0 0 0.08 1 force @a[distance=..100]
execute if score @s spellcrafter.speed matches 9..10 run particle minecraft:firework ~ ~ ~ 0 0 0 0.10 1 force @a[distance=..100]
execute if score @s spellcrafter.speed matches 11.. run particle minecraft:firework ~ ~ ~ 0 0 0 0.12 1 force @a[distance=..100]
