#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.tick
scoreboard players operation $rem spellcrafter.tmp %= #5 spellcrafter.math
execute unless score $rem spellcrafter.tmp matches 0 run return 0

scoreboard players operation @s spellcrafter.speed *= #2 spellcrafter.math

execute if score @s spellcrafter.speed matches 0 run scoreboard players add @s spellcrafter.speed 1
execute if score @s spellcrafter.speed matches 1001.. run scoreboard players set @s spellcrafter.speed 1000
execute if score @s spellcrafter.speed matches ..-1001 run scoreboard players set @s spellcrafter.speed -1000
