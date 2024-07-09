#> as any
# storage "isc:tmp wand.spells" must start empty


# Save spell slot
data modify storage isc:tmp wand.slots append from storage isc:tmp keep[0].Slot


# Get spell id & lore
data remove storage isc:tmp spell
data modify storage isc:tmp spell set from storage isc:tmp keep[0].components."minecraft:custom_data".isc.spell
data modify storage isc:tmp wand.spells append from storage isc:tmp spell.id
data modify storage isc:tmp lore append from storage isc:tmp spell.lore
scoreboard players set $spell isc.tmp 0
execute store result score $spell isc.tmp run data get storage isc:tmp spell.id


# Special cases: spells that turn into other spells (while keeping their own mana cost and cooldown - only their id changes)
execute if score $spell isc.tmp matches 93 store result score $spell isc.tmp run data get storage isc:tmp keep[-1].components."minecraft:custom_data".isc.spell.id
execute if score $spell isc.tmp matches 50 store result score $spell isc.tmp run data get storage isc:tmp keep[1].components."minecraft:custom_data".isc.spell.id


# Special cases
execute if score $spell isc.tmp matches 64 run scoreboard players add $spell.sharp isc.tmp 1
execute if score $spell isc.tmp matches 69 run scoreboard players set $spell.secret isc.tmp 1
execute if score $spell isc.tmp matches 70 run scoreboard players set $spell.locked isc.tmp 1
execute if score $spell isc.tmp matches 83 run scoreboard players add $spell.extended isc.tmp 1
execute if score $spell isc.tmp matches 84 run scoreboard players add $spell.quickstep isc.tmp 1


# Special case: "skip" ignores the mana cost and cooldown of the next spell
execute if score $spell.skip isc.tmp matches 1 run return run scoreboard players set $spell.skip isc.tmp 0
execute if score $spell isc.tmp matches 92 run scoreboard players set $spell.skip isc.tmp 1


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
execute if score $spell isc.tmp matches 6 run scoreboard players operation $add isc.tmp *= $clone_multiplier isc.tmp
execute if score $spell isc.tmp matches 6 run scoreboard players operation $clone_multiplier isc.tmp *= #2 isc.math 

# Mana: update
scoreboard players operation $mana isc.tmp += $add isc.tmp
