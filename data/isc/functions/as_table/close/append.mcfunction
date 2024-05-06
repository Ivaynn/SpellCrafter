#> as any
# storage "isc:tmp wand.spells" must start empty


# Check if item is not a spell --> add to "drop"
execute unless data storage isc:tmp items[0].components."minecraft:custom_data".isc.spell.id run return run data modify storage isc:tmp drop append from storage isc:tmp items[0]


# Save spell slot
data modify storage isc:tmp wand.slots append from storage isc:tmp items[0].Slot


# Get spell id & lore
data remove storage isc:tmp spell
data modify storage isc:tmp spell set from storage isc:tmp items[0].components."minecraft:custom_data".isc.spell
data modify storage isc:tmp wand.spells append from storage isc:tmp spell.id
data modify storage isc:tmp lore append from storage isc:tmp spell.lore


# Get spell mana cost
scoreboard players set $add isc.tmp 0
execute store result score $add isc.tmp run data get storage isc:tmp spell.mana
execute if data storage isc:tmp {spell:{id:"clone"}} run scoreboard players operation $add isc.tmp *= $clone_multiplier isc.tmp
scoreboard players operation $mana isc.tmp += $add isc.tmp


# Mana cost overflow prevention
execute unless score $mana isc.tmp matches 0.. run scoreboard players set $mana isc.tmp 2147483647


# Clone multiplier
execute if data storage isc:tmp {spell:{id:"clone"}} run scoreboard players operation $clone_multiplier isc.tmp *= #2 isc.math 
