
scoreboard players operation $mana isc.tmp = @s isc.mana
scoreboard players operation $mana isc.tmp *= #100 isc.math
scoreboard players operation $mana isc.tmp /= @s isc.max_mana

scoreboard players operation $d0 isc.tmp = @s isc.cooldown
scoreboard players operation $d0 isc.tmp /= #20 isc.math

scoreboard players operation $d1 isc.tmp = @s isc.cooldown
scoreboard players operation $d1 isc.tmp %= #20 isc.math
scoreboard players operation $d1 isc.tmp *= #5 isc.math

scoreboard players operation $d2 isc.tmp = $d1 isc.tmp
scoreboard players operation $d2 isc.tmp %= #10 isc.math

scoreboard players operation $d1 isc.tmp /= #10 isc.math

execute if score $mana isc.tmp matches ..0005 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"","color":"aqua"},{"text":"▌▌▌▌▌▌▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 06..15 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌","color":"aqua"},{"text":"▌▌▌▌▌▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 16..25 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌","color":"aqua"},{"text":"▌▌▌▌▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 26..35 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌","color":"aqua"},{"text":"▌▌▌▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 36..45 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌","color":"aqua"},{"text":"▌▌▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 46..55 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌▌","color":"aqua"},{"text":"▌▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 56..65 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌▌▌","color":"aqua"},{"text":"▌▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 66..75 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌▌▌▌","color":"aqua"},{"text":"▌▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 76..85 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌▌▌▌▌","color":"aqua"},{"text":"▌▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 86..95 run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌▌▌▌▌▌","color":"aqua"},{"text":"▌","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
execute if score $mana isc.tmp matches 0096.. run title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"}," ",{"text":"▌▌▌▌▌▌▌▌▌▌","color":"aqua"},{"text":"","color":"gray"}," ",{"score":{"name":"$d0","objective":"isc.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"isc.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"isc.tmp"},"color":"gray"}]
