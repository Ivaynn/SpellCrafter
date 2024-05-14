#> as player, at barrel (player id matches table id)
# score "$cooldown isc.tmp" must contain cooldown in ticks

# less than 1 -> return "0"
execute unless score $cooldown isc.tmp matches 1.. run data modify storage isc:tmp time set value '["",{"text":"0","color":"gray"}]'
execute unless score $cooldown isc.tmp matches 1.. run return 0


# Digits: 0.12
scoreboard players operation $d0 isc.tmp = $cooldown isc.tmp
scoreboard players operation $d0 isc.tmp /= #20 isc.math

scoreboard players operation $d1 isc.tmp = $cooldown isc.tmp
scoreboard players operation $d1 isc.tmp %= #20 isc.math
scoreboard players operation $d1 isc.tmp *= #5 isc.math

scoreboard players operation $d2 isc.tmp = $d1 isc.tmp
scoreboard players operation $d2 isc.tmp %= #10 isc.math

scoreboard players operation $d1 isc.tmp /= #10 isc.math


# Return
execute if score $d2 isc.tmp matches 0 run data modify storage isc:tmp time set value '["",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"}]'
execute if score $d2 isc.tmp matches 1.. run data modify storage isc:tmp time set value '["",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]'
