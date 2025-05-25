#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.dist
scoreboard players remove $rem spellcrafter.tmp 1
scoreboard players operation $rem spellcrafter.tmp %= #16 spellcrafter.math

execute if score $rem spellcrafter.tmp matches 4 if score @s spellcrafter.dist matches 5..8 at @s run tp @s ^ ^-0.424 ^
execute if score $rem spellcrafter.tmp matches 5 if score @s spellcrafter.dist matches 5..8 at @s run tp @s ^ ^-0.344 ^
execute if score $rem spellcrafter.tmp matches 6 if score @s spellcrafter.dist matches 5..8 at @s run tp @s ^ ^-0.228 ^
execute if score $rem spellcrafter.tmp matches 7 if score @s spellcrafter.dist matches 5..8 at @s run tp @s ^ ^-0.082 ^

execute if score @s spellcrafter.dist matches 8.. at @s run function spellcrafter:spells/spiral/free
