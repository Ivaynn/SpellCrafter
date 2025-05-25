#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.dist
scoreboard players add $rem spellcrafter.tmp 8
scoreboard players operation $rem spellcrafter.tmp %= #32 spellcrafter.math


execute if score $rem spellcrafter.tmp matches 0..15 at @s run tp @s ^0.2 ^ ^
execute if score $rem spellcrafter.tmp matches 16..31 at @s run tp @s ^-0.2 ^ ^
