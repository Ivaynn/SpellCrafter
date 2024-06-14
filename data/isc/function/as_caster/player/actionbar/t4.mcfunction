
scoreboard players operation $d0 isc.tmp = @s isc.cooldown
scoreboard players operation $d0 isc.tmp /= #20 isc.math

scoreboard players operation $d1 isc.tmp = @s isc.cooldown
scoreboard players operation $d1 isc.tmp %= #20 isc.math
scoreboard players operation $d1 isc.tmp *= #5 isc.math

scoreboard players operation $d2 isc.tmp = $d1 isc.tmp
scoreboard players operation $d2 isc.tmp %= #10 isc.math

scoreboard players operation $d1 isc.tmp /= #10 isc.math

title @s actionbar ["",{"text":"◆ ","color":"aqua"},{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"},{"text":"/","color":"aqua"},{"score":{"name":"@s","objective":"isc.max_mana"},"color":"aqua"},{"text":"   ⌚ ","color":"gray"},{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
