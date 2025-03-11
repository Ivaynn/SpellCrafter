#> as any
# called on close table


# Get number of spells after this one
execute store result score $reduction spellcrafter.tmp run data get storage spellcrafter:tmp keep
scoreboard players remove $reduction spellcrafter.tmp 1

# Apply cost reduction
scoreboard players operation $reduction spellcrafter.tmp *= #10 spellcrafter.math
scoreboard players operation $add spellcrafter.tmp -= $reduction spellcrafter.tmp
