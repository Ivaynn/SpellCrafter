#> as target, at projectile

execute if score @s spellcrafter.damage matches 1.. run return 0
scoreboard players operation $damage spellcrafter.tmp = $tmp.damage spellcrafter.tmp


# Check if target is in water
scoreboard players set $in_water spellcrafter.tmp 0
execute at @s if block ~ ~ ~ minecraft:water run scoreboard players set $in_water spellcrafter.tmp 1
execute at @s if block ~ ~0.5 ~ minecraft:water run scoreboard players set $in_water spellcrafter.tmp 1


# Target in water: double damage
execute if score $in_water spellcrafter.tmp matches 1 run scoreboard players operation $damage spellcrafter.tmp *= #2 spellcrafter.math
function spellcrafter:damage/add
