# input storage: spellcrafter:tmp trigger.code.characters
# Base 64 dictionary: ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/

data modify storage spellcrafter:tmp trigger.code.character set string storage spellcrafter:tmp trigger.code.characters 0 1
function spellcrafter:as_table/open/book/read_one
execute unless score $value spellcrafter.tmp matches 0..63 run return 0
scoreboard players operation $copy spellcrafter.tmp = $value spellcrafter.tmp

data modify storage spellcrafter:tmp trigger.code.character set string storage spellcrafter:tmp trigger.code.characters 1 2
function spellcrafter:as_table/open/book/read_one
execute unless score $value spellcrafter.tmp matches 0..63 run return 0
scoreboard players operation $copy spellcrafter.tmp *= #64 spellcrafter.math

scoreboard players operation $value spellcrafter.tmp += $copy spellcrafter.tmp
execute unless score $value spellcrafter.tmp matches 0..4095 run scoreboard players set $value spellcrafter.tmp -1
