#> as any, at barrel


# Get the first spell
scoreboard players set $spell isc.tmp 0
execute store result score $spell isc.tmp run data get storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.spells[0]


# Insert item
function isc:as_table/open/loot_insert
