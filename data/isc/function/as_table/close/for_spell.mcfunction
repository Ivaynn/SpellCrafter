#> recursive function (limited by score "$iter isc.tmp")
#> as any
# storage "isc:tmp wand.spells" must start empty


# Append data to storage lists (wand.spells, lore, drop)
function isc:as_table/close/append


# Next item
data remove storage isc:tmp keep[0]
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_table/close/for_spell
