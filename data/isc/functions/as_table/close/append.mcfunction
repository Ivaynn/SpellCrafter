#> as any
# storage "isc:tmp wand.spells" must start empty


# Check if item is not a spell --> add to "drop"
execute unless data storage isc:tmp items[0].tag.isc.spell.id run return run data modify storage isc:tmp drop append from storage isc:tmp items[0]


# Save spell slot
data modify storage isc:tmp wand.slots append from storage isc:tmp items[0].Slot


# Get spell id & lore
data remove storage isc:tmp spell
data modify storage isc:tmp spell set from storage isc:tmp items[0].tag.isc.spell
data modify storage isc:tmp wand.spells append from storage isc:tmp spell.id
data modify storage isc:tmp lore append from storage isc:tmp spell.lore


# Get spell mana cost
scoreboard players set $add isc.tmp 0
execute if score $drop isc.tmp matches 0 run execute store result score $add isc.tmp run data get storage isc:tmp spell.mana
scoreboard players operation $mana isc.tmp += $add isc.tmp
