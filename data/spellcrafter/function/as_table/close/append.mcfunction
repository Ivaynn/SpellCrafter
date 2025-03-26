#> as any
# storage "spellcrafter:tmp wand.spells" must start empty


# Save spell slot
data modify storage spellcrafter:tmp wand.slots append from storage spellcrafter:tmp keep[0].Slot


# Get spell data
data remove storage spellcrafter:tmp spell
data modify storage spellcrafter:tmp spell set from storage spellcrafter:tmp keep[0].components."minecraft:custom_data".spellcrafter.spell


# Get spell id & lore
data modify storage spellcrafter:tmp wand.spells append from storage spellcrafter:tmp spell.id
data modify storage spellcrafter:tmp lore append from storage spellcrafter:tmp spell.lore
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp spell.id


# Special cases
execute if score $spell spellcrafter.tmp matches 64 run scoreboard players add $spell.sharp spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 69 run scoreboard players set $spell.secret spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 70 run scoreboard players set $spell.locked spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 83 run scoreboard players add $spell.extended spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 84 run scoreboard players add $spell.quickstep spellcrafter.tmp 1


# Special case: "skip" ignores the mana cost and cooldown of the next spell
execute if score $spell.skip spellcrafter.tmp matches 1 run return run scoreboard players set $spell.skip spellcrafter.tmp 0
execute if score $spell spellcrafter.tmp matches 92 run scoreboard players set $spell.skip spellcrafter.tmp 1


# Spell cooldown
scoreboard players set $add spellcrafter.tmp 0
execute store result score $add spellcrafter.tmp run data get storage spellcrafter:tmp spell.cooldown
scoreboard players operation $cooldown spellcrafter.tmp += $add spellcrafter.tmp


# Mana: prevent overflow - if clone multiplier is too high, just set mana cost to the integer limit
execute if score $clone_multiplier spellcrafter.tmp matches 1024.. run return run scoreboard players set $mana spellcrafter.tmp 2147483647

# Mana: get spell cost (can be positive or negative)
scoreboard players set $add spellcrafter.tmp 0
execute store result score $add spellcrafter.tmp run data get storage spellcrafter:tmp spell.mana
execute if score $add spellcrafter.tmp matches ..-1 run scoreboard players set $is_negative spellcrafter.tmp 1

# Mana: apply clone multiplier (exponential)
execute if score $spell spellcrafter.tmp matches 6 run scoreboard players operation $add spellcrafter.tmp *= $clone_multiplier spellcrafter.tmp
execute if score $spell spellcrafter.tmp matches 6 run scoreboard players operation $clone_multiplier spellcrafter.tmp *= #2 spellcrafter.math 

# Mana: apply cost reductions
execute if score $spell spellcrafter.tmp matches 52 run function spellcrafter:spells/shuffle/mana_cost

# Mana: update
scoreboard players operation $mana spellcrafter.tmp += $add spellcrafter.tmp
