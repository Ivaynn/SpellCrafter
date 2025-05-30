
scoreboard players add $actionbar.cooldown spellcrafter.tmp 19
scoreboard players operation $actionbar.cooldown spellcrafter.tmp /= #20 spellcrafter.math
title @s actionbar ["",{text:"◆ ",color:"aqua"},{score:{name:"$actionbar.mana",objective:"spellcrafter.tmp"},color:"aqua"},{text:"   ⌚ ",color:"gray"},{score:{name:"$actionbar.cooldown",objective:"spellcrafter.tmp"},color:"gray"}]
