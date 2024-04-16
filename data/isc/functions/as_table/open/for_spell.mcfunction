#> recursive function (limited by length of storage "isc:tmp wand.spells")
#> as any, at barrel
# storage "isc:tmp wand.spells" must contain the spell list


# Insert item into barrel
execute if score $has_slots isc.tmp matches 1 run function isc:as_table/open/insert
execute if score $has_slots isc.tmp matches 0 run function isc:as_table/open/insert_fast


# Next iteration...
scoreboard players add $iter isc.tmp 1
execute if score $iter isc.tmp matches ..26 if data storage isc:tmp wand.spells[0] run function isc:as_table/open/for_spell
