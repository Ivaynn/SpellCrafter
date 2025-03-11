#> as (other) projectile, at @s

scoreboard players operation $count_diff spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $count_diff spellcrafter.tmp *= #5 spellcrafter.math
scoreboard players operation $count spellcrafter.tmp += $count_diff spellcrafter.tmp
particle minecraft:smoke ~ ~ ~ 0 0 0 0.06 10 normal @a
function spellcrafter:as_projectile/remove
