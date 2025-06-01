# as any, on table close


# Temporary operation
execute store result score $tmp.base_cooldown spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_cooldown
scoreboard players remove $tmp.base_cooldown spellcrafter.tmp 10


# Cancel
execute unless score $tmp.base_cooldown spellcrafter.tmp matches -9.. run return run scoreboard players set $spell spellcrafter.tmp 0
execute unless score $tmp.base_cooldown spellcrafter.tmp matches 0.. run scoreboard players set $tmp.base_cooldown spellcrafter.tmp 0


# Apply
execute store result storage spellcrafter:tmp wand.base_cooldown int 1 run scoreboard players get $tmp.base_cooldown spellcrafter.tmp
scoreboard players remove $cooldown spellcrafter.tmp 10
scoreboard players add $spell_cap spellcrafter.tmp 1
