#> as any
# called on close table


# Get number of spells after this one
scoreboard players operation $reduction spellcrafter.tmp = $iter spellcrafter.tmp
scoreboard players remove $reduction spellcrafter.tmp 1

# Apply cost reduction
scoreboard players operation $reduction spellcrafter.tmp *= #10 spellcrafter.math
scoreboard players operation $add spellcrafter.tmp -= $reduction spellcrafter.tmp
