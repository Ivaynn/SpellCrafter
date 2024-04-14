#> recursive function (limited by length of storage "isc:tmp wand.spells")
#> as any, at barrel
# storage "isc:tmp wand.spells" must contain the spell list


# Iteration counter
scoreboard players add $iter isc.tmp 1


# Get the first spell
data remove storage isc:tmp iter
data modify storage isc:tmp iter set from storage isc:tmp wand.spells[0]


# Get item
function isc:as_table/open/loot_insert


# Next iteration...
data remove storage isc:tmp wand.spells[0]
execute if data storage isc:tmp wand.spells[0] run function isc:as_table/open/for_spell
