#> as player, at @s

scoreboard players operation $rem spellcrafter.tmp = $gametime spellcrafter.tmp
scoreboard players operation $rem spellcrafter.tmp %= #100 spellcrafter.math
execute unless score $rem spellcrafter.tmp matches 0 run return 0

effect give @s minecraft:regeneration 1 2 true
effect give @s minecraft:saturation 1 0 true
