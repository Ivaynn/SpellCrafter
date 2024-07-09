#> recursive function (limited by score "$iter isc.tmp")
#> as any
# storage "isc:tmp drop" must start empty
# storage "isc:tmp keep" must start empty


scoreboard players set $is_spell isc.tmp 0
execute if data storage isc:tmp items[0].components."minecraft:custom_data".isc.spell.id run scoreboard players set $is_spell isc.tmp 1


# Separate spells and non-spells
execute if score $is_spell isc.tmp matches 0 run data modify storage isc:tmp drop append from storage isc:tmp items[0]
execute if score $is_spell isc.tmp matches 1 run data modify storage isc:tmp keep append from storage isc:tmp items[0]


# Next item
data remove storage isc:tmp items[0]
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_table/close/for_item
