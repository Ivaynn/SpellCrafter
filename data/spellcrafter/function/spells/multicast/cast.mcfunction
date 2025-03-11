#> as projectile, on summon, at @s
#> recursive function (limited by length of storage "spellcrafter:tmp wand.spells" and score "$spell.multicast spellcrafter.tmp")


# If there are no more spells, cancel this
execute unless data storage spellcrafter:tmp wand.spells[0] run return run scoreboard players set $spell.multicast spellcrafter.tmp 0


# Create a projectile with the spell data
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $clone_count spellcrafter.tmp = @s spellcrafter.clone
data modify storage spellcrafter:tmp rotation set from entity @s Rotation
scoreboard players remove $spell.multicast spellcrafter.tmp 1
# (storage "spellcrafter:tmp wand" is the same)

execute summon minecraft:marker run function spellcrafter:as_projectile/summon


# Apply offset
function spellcrafter:spells/multicast/offset


# Remove stored spells
data remove entity @s data.spellcrafter.spells


# Next projectile
execute unless score $spell.multicast spellcrafter.tmp matches 1.. run return 0
function spellcrafter:spells/multicast/cast
