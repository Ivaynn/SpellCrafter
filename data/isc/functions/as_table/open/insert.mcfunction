#> as any, at barrel

# Check current spell slot
execute store result score $slot isc.tmp run data get storage isc:tmp wand.slots[0] 1
execute unless score $iter isc.tmp = $slot isc.tmp run return run loot insert ~ ~ ~ loot isc:invalid


# Get the first spell
data remove storage isc:tmp spell
data modify storage isc:tmp spell set from storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.slots[0]


# Insert item
function isc:as_table/open/loot_insert
