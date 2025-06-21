#> as target, at projectile

execute if score @s spellcrafter.damage matches 1.. run return 0
scoreboard players operation $damage spellcrafter.tmp = $tmp.damage spellcrafter.tmp


# Check if target is in water
scoreboard players set $in_water spellcrafter.tmp 0
execute at @s if block ~ ~ ~ minecraft:water run scoreboard players set $in_water spellcrafter.tmp 1
execute at @s if block ~ ~0.5 ~ minecraft:water run scoreboard players set $in_water spellcrafter.tmp 1


# Target not in water: use base damage and range
execute if score $in_water spellcrafter.tmp matches 0 as @s[distance=..1.5] run function spellcrafter:damage/add
execute if score $in_water spellcrafter.tmp matches 0 run return 1


# Target in water: double damage and range
scoreboard players operation $damage spellcrafter.tmp *= #2 spellcrafter.math
function spellcrafter:damage/add
