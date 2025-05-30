#> as player, at barrel
#> as item_display, at @s
# score "$cooldown spellcrafter.tmp" must contain cooldown in ticks

# less than 1 -> return "0"
execute unless score $cooldown spellcrafter.tmp matches 1.. run data modify storage spellcrafter:tmp time set value ["",{text:"0",color:"gray"}]
execute unless score $cooldown spellcrafter.tmp matches 1.. run return 0


# Digits: 0.12
scoreboard players operation $d0 spellcrafter.tmp = $cooldown spellcrafter.tmp
scoreboard players operation $d0 spellcrafter.tmp /= #20 spellcrafter.math

scoreboard players operation $d1 spellcrafter.tmp = $cooldown spellcrafter.tmp
scoreboard players operation $d1 spellcrafter.tmp %= #20 spellcrafter.math
scoreboard players operation $d1 spellcrafter.tmp *= #5 spellcrafter.math

scoreboard players operation $d2 spellcrafter.tmp = $d1 spellcrafter.tmp
scoreboard players operation $d2 spellcrafter.tmp %= #10 spellcrafter.math

scoreboard players operation $d1 spellcrafter.tmp /= #10 spellcrafter.math


# Return
execute if score $d2 spellcrafter.tmp matches 0 run data modify storage spellcrafter:tmp time set value ["",{score:{name:"$d0",objective:"spellcrafter.tmp"},color:"gray"},{text:".",color:"gray"},{score:{name:"$d1",objective:"spellcrafter.tmp"},color:"gray"}]
execute if score $d2 spellcrafter.tmp matches 1.. run data modify storage spellcrafter:tmp time set value ["",{score:{name:"$d0",objective:"spellcrafter.tmp"},color:"gray"},{text:".",color:"gray"},{score:{name:"$d1",objective:"spellcrafter.tmp"},color:"gray"},{score:{name:"$d2",objective:"spellcrafter.tmp"},color:"gray"}]
