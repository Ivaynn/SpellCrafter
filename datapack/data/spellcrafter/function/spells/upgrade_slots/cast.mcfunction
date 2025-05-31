# as any, on table close


# Temporary operation
execute store result score $tmp.cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap
scoreboard players add $tmp.cap spellcrafter.tmp 1


# Cancel
execute unless score $tmp.cap spellcrafter.tmp matches 1..27 run return run scoreboard players set $spell spellcrafter.tmp 0


# Apply
execute store result storage spellcrafter:tmp wand.cap int 1 run scoreboard players get $tmp.cap spellcrafter.tmp
scoreboard players add $spell_cap spellcrafter.tmp 1
