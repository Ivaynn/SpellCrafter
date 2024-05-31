#> [tick] as goat

scoreboard players operation $rem isc.tmp = @s isc.age
scoreboard players operation $rem isc.tmp %= #10 isc.math

execute unless score $rem isc.tmp matches 0 run return 0

execute positioned ~ ~1.25 ~ run particle minecraft:angry_villager ^ ^ ^0.5 0.2 0.2 0.2 0 0 normal @a

scoreboard players set $tmp isc.tmp 0
execute store result score $tmp isc.tmp run data get entity @s Brain.memories."minecraft:ram_cooldown_ticks".value
execute unless score $tmp isc.tmp matches 0 run data modify entity @s Brain.memories."minecraft:ram_cooldown_ticks".value set value 0
