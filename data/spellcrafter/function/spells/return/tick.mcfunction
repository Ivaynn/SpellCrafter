#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.tick
scoreboard players operation $rem spellcrafter.tmp %= #2 spellcrafter.math

execute if score $rem spellcrafter.tmp matches 0 run scoreboard players remove @s spellcrafter.speed 1
