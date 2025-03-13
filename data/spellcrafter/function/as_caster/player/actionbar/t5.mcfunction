
scoreboard players operation $cooldown spellcrafter.tmp = $cooldown.this spellcrafter.tmp
scoreboard players add $cooldown spellcrafter.tmp 19
scoreboard players operation $cooldown spellcrafter.tmp /= #20 spellcrafter.math
title @s actionbar ["",{"text":"◆ ","color":"aqua"},{"score":{"name":"@s","objective":"spellcrafter.mana"},"color":"aqua"},{"text":"/","color":"aqua"},{"score":{"name":"@s","objective":"spellcrafter.max_mana"},"color":"aqua"},{"text":"   ⌚ ","color":"gray"},{"score":{"name":"$cooldown","objective":"spellcrafter.tmp"},"color":"gray"}]
