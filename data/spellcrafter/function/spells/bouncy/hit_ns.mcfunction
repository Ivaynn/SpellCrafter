#> as projectile, at @s

scoreboard players set $is_negative spellcrafter.tmp 0
execute if score $r0 spellcrafter.tmp matches ..0 run scoreboard players set $is_negative spellcrafter.tmp 1

execute if score $is_negative spellcrafter.tmp matches 1 run scoreboard players add $r0 spellcrafter.tmp 180
execute if score $is_negative spellcrafter.tmp matches 0 run scoreboard players remove $r0 spellcrafter.tmp 180
scoreboard players operation $r0 spellcrafter.tmp *= #n1 spellcrafter.math
