#> [tick] as projectile, at @s


# Effects
particle minecraft:entity_effect{color:[1.0,0.5,0.8,1.00]} ~ ~-1 ~ 1.8 0 1.8 0 5 force @a[distance=..50]


# Apply the effect every X ticks
scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #20 spellcrafter.math

execute unless score $rem spellcrafter.tmp matches 0 run return 0

execute positioned ~ ~-1 ~ run effect give @e[distance=..3,type=!#spellcrafter:untargetable,tag=!spellcrafter.spectator] minecraft:regeneration 2 1 false
