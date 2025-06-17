#> [tick] as player, at @s

scoreboard players operation $rem spellcrafter.tmp = $gametime spellcrafter.tmp
scoreboard players operation $rem spellcrafter.tmp %= #4 spellcrafter.math
execute unless score $rem spellcrafter.tmp matches 0 run return 0

scoreboard players operation @s spellcrafter.mana += @s spellcrafter.mana_reg
