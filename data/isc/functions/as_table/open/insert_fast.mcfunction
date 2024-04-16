#> as any, at barrel


# Get the first spell
data remove storage isc:tmp spell
data modify storage isc:tmp spell set from storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.spells[0]


# Insert item
function isc:as_table/open/loot_insert
