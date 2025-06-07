#> [tick] as goat, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #10 spellcrafter.math

execute unless score $rem spellcrafter.tmp matches 0 run return 0

execute positioned ~ ~1.25 ~ run particle minecraft:angry_villager ^ ^ ^0.5 0.2 0.2 0.2 0 0 normal @a[distance=..100]

scoreboard players set $tmp spellcrafter.tmp 0
execute store result score $tmp spellcrafter.tmp run data get entity @s Brain.memories."minecraft:ram_cooldown_ticks".value
execute unless score $tmp spellcrafter.tmp matches 0 run data modify entity @s Brain.memories."minecraft:ram_cooldown_ticks".value set value 0
