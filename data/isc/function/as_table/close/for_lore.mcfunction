#> recursive function (limited by score "$iter isc.tmp")
#> as player
# storage "isc:tmp lore" must contain the lore array
# score "$iter isc.tmp" must contain the number of elements of the array


# Special case: secret
execute if score $spell.secret isc.tmp matches 1 run function isc:spells/secret/cast


# Add lore line
item modify entity @s weapon isc:wand/lore/add_spell
data remove storage isc:tmp lore[0]


# Iterate
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_table/close/for_lore
