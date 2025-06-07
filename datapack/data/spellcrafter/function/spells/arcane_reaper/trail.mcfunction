#> as projectile, at @s

execute if score @s spellcrafter.damage matches ..2 run particle minecraft:dust{color:[0.2,0.0,0.0],scale:1} ~ ~ ~ 0 0 0 0 1 force @a[distance=..100]
execute if score @s spellcrafter.damage matches 3..6 run particle minecraft:dust{color:[0.4,0.0,0.0],scale:1} ~ ~ ~ 0.03 0.03 0.03 0 1 force @a[distance=..100]
execute if score @s spellcrafter.damage matches 7..10 run particle minecraft:dust{color:[0.6,0.0,0.0],scale:1} ~ ~ ~ 0.06 0.06 0.06 1 1 force @a[distance=..100]
execute if score @s spellcrafter.damage matches 11..14 run particle minecraft:dust{color:[0.8,0.0,0.0],scale:1} ~ ~ ~ 0.09 0.09 0.09 1 1 force @a[distance=..100]
execute if score @s spellcrafter.damage matches 15..18 run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1} ~ ~ ~ 0.12 0.12 0.12 1 1 force @a[distance=..100]
execute if score @s spellcrafter.damage matches 19.. run particle minecraft:dust{color:[1.0,0.3,0.3],scale:1} ~ ~ ~ 0.15 0.15 0.15 2 1 force @a[distance=..100]
