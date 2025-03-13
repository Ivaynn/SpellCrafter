
scoreboard players operation $actionbar.d0 spellcrafter.tmp = $actionbar.cooldown spellcrafter.tmp
scoreboard players operation $actionbar.d0 spellcrafter.tmp /= #20 spellcrafter.math

scoreboard players operation $actionbar.d1 spellcrafter.tmp = $actionbar.cooldown spellcrafter.tmp
scoreboard players operation $actionbar.d1 spellcrafter.tmp %= #20 spellcrafter.math
scoreboard players operation $actionbar.d1 spellcrafter.tmp *= #5 spellcrafter.math

scoreboard players operation $actionbar.d2 spellcrafter.tmp = $actionbar.d1 spellcrafter.tmp
scoreboard players operation $actionbar.d2 spellcrafter.tmp %= #10 spellcrafter.math

scoreboard players operation $actionbar.d1 spellcrafter.tmp /= #10 spellcrafter.math

title @s actionbar ["",{"text":"◆ ","color":"aqua"},{"score":{"name":"$actionbar.mana","objective":"spellcrafter.tmp"},"color":"aqua"},{"text":"/","color":"aqua"},{"score":{"name":"$actionbar.max_mana","objective":"spellcrafter.tmp"},"color":"aqua"},{"text":"   ⌚ ","color":"gray"},{"score":{"name":"$actionbar.d0","objective":"spellcrafter.tmp"},"color":"gray"},{"text":".","color":"gray"},{"score":{"name":"$actionbar.d1","objective":"spellcrafter.tmp"},"color":"gray"},{"score":{"name":"$actionbar.d2","objective":"spellcrafter.tmp"},"color":"gray"}]
