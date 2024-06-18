#> as projectile, at @s

scoreboard players set $is_negative isc.tmp 0
execute if score $r0 isc.tmp matches ..0 run scoreboard players set $is_negative isc.tmp 1

execute if score $is_negative isc.tmp matches 1 run scoreboard players add $r0 isc.tmp 180
execute if score $is_negative isc.tmp matches 0 run scoreboard players remove $r0 isc.tmp 180
scoreboard players operation $r0 isc.tmp *= #n1 isc.math
