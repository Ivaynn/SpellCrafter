#> [tick] as wind_charge

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #2 spellcrafter.math
execute store result entity @s Air double 1 run scoreboard players get $rem spellcrafter.tmp
