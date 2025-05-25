#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.tick
scoreboard players operation $rem spellcrafter.tmp %= #15 spellcrafter.math

execute if score $rem spellcrafter.tmp matches 0 run scoreboard players add @s spellcrafter.damage 1
