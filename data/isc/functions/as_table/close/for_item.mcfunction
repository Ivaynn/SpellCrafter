#> recursive function (limited by length of storage "isc:tmp items")
#> as any
# storage "isc:tmp wand.spells" must start empty


# Check if item is not a spell --> drop
scoreboard players set $drop isc.tmp 0
execute unless data storage isc:tmp items[0].tag.isc.spell.id run scoreboard players set $drop isc.tmp 1 


# Get spell id & lore
execute if score $drop isc.tmp matches 0 run data modify storage isc:tmp wand.spells append from storage isc:tmp items[0].tag.isc.spell.id
execute if score $drop isc.tmp matches 0 run data modify storage isc:tmp lore append from storage isc:tmp items[0].tag.isc.spell.lore


# Get spell mana cost
scoreboard players set $add isc.tmp 0
execute if score $drop isc.tmp matches 0 run execute store result score $add isc.tmp run data get storage isc:tmp items[0].tag.isc.spell.mana
scoreboard players operation $mana isc.tmp += $add isc.tmp


# Drop
execute if score $drop isc.tmp matches 1 run data modify storage isc:tmp drop append from storage isc:tmp items[0]


# Next item
data remove storage isc:tmp items[0]
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_table/close/for_item
