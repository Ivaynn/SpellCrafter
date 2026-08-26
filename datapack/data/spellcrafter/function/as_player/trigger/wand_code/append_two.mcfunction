# input score: $value spellcrafter.tmp
# Base 64 dictionary: ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/

scoreboard players operation $copy spellcrafter.tmp = $value spellcrafter.tmp
scoreboard players operation $value spellcrafter.tmp /= #64 spellcrafter.math
function spellcrafter:as_player/trigger/wand_code/append_one

scoreboard players operation $value spellcrafter.tmp = $copy spellcrafter.tmp
scoreboard players operation $value spellcrafter.tmp %= #64 spellcrafter.math
function spellcrafter:as_player/trigger/wand_code/append_one
