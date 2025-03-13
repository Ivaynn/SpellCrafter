
scoreboard players operation $d0 spellcrafter.tmp = $cooldown.this spellcrafter.tmp
scoreboard players operation $d0 spellcrafter.tmp /= #20 spellcrafter.math

scoreboard players operation $d1 spellcrafter.tmp = $cooldown.this spellcrafter.tmp
scoreboard players operation $d1 spellcrafter.tmp %= #20 spellcrafter.math
scoreboard players operation $d1 spellcrafter.tmp *= #5 spellcrafter.math

scoreboard players operation $d2 spellcrafter.tmp = $d1 spellcrafter.tmp
scoreboard players operation $d2 spellcrafter.tmp %= #10 spellcrafter.math

scoreboard players operation $d1 spellcrafter.tmp /= #10 spellcrafter.math

title @s actionbar ["",{"text":"◆ ","color":"aqua"},{"score":{"name":"@s","objective":"spellcrafter.mana"},"color":"aqua"},{"text":"   ⌚ ","color":"gray"},{"score":{"name":"$d0","objective":"spellcrafter.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$d1","objective":"spellcrafter.tmp"},"color":"gray"},{"score":{"name":"$d2","objective":"spellcrafter.tmp"},"color":"gray"}]
