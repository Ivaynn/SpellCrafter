#> as any, at barrel

# Check current spell slot
execute store result score $slot spellcrafter.tmp run data get storage spellcrafter:tmp wand.slots[0] 1
execute unless score $iter spellcrafter.tmp = $slot spellcrafter.tmp run return run loot insert ~ ~ ~ loot spellcrafter:invalid


# Get the first spell
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[0]
data remove storage spellcrafter:tmp wand.spells[0]
data remove storage spellcrafter:tmp wand.slots[0]


# Insert item
function spellcrafter:as_table/open/loot_insert
