
scoreboard players operation $cooldown isc.tmp = @s isc.cooldown
scoreboard players add $cooldown isc.tmp 19
scoreboard players operation $cooldown isc.tmp /= #20 isc.math
title @s actionbar ["",{"text":"◆ ","color":"aqua"},{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"},{"text":"   ⌚ ","color":"gray"},{"score":{"name":"$cooldown","objective":"isc.tmp"},"color":"gray"}]
