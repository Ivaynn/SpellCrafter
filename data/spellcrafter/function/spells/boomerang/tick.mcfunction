#> [tick] as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.tick
scoreboard players operation $rem spellcrafter.tmp %= #5 spellcrafter.math

execute unless score $rem spellcrafter.tmp matches 4 run return 0


scoreboard players operation $speed spellcrafter.tmp = @s spellcrafter.speed
execute if score $speed spellcrafter.tmp matches ..-1 run scoreboard players operation $speed spellcrafter.tmp *= #n1 spellcrafter.math

execute if score $speed spellcrafter.tmp matches 1..3 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.3
execute if score $speed spellcrafter.tmp matches 4..6 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.4
execute if score $speed spellcrafter.tmp matches 7..9 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.5
execute if score $speed spellcrafter.tmp matches 10..12 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.6
execute if score $speed spellcrafter.tmp matches 13..19 run playsound minecraft:entity.bat.takeoff player @a ^ ^ ^ 2 1.7
