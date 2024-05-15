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


# Spell cooldown
scoreboard players set $add isc.tmp 0
execute store result score $add isc.tmp run data get storage isc:tmp spell.cooldown
scoreboard players operation $cooldown isc.tmp += $add isc.tmp


# Mana: prevent overflow - if clone multiplier is too high, just set mana cost to the integer limit
execute if score $clone_multiplier isc.tmp matches 1024.. run return run scoreboard players set $mana isc.tmp 2147483647

# Mana: get spell cost (can be positive or negative)
scoreboard players set $add isc.tmp 0
execute store result score $add isc.tmp run data get storage isc:tmp spell.mana
execute if score $add isc.tmp matches ..-1 run scoreboard players set $is_negative isc.tmp 1

# Mana: apply clone multiplier (exponential)
scoreboard players set $spell isc.tmp 0
execute store result score $spell isc.tmp run data get storage isc:tmp spell.id
execute if score $spell isc.tmp matches 6 run scoreboard players operation $add isc.tmp *= $clone_multiplier isc.tmp
execute if score $spell isc.tmp matches 6 run scoreboard players operation $clone_multiplier isc.tmp *= #2 isc.math 

# Mana: update
scoreboard players operation $mana isc.tmp += $add isc.tmp
