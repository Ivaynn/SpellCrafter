#> as projectile, on summon, at @s
#> recursive function (limited by length of storage "isc:tmp wand.spells" and score "$spell.multicast isc.tmp")


# If there are no more spells, cancel this
execute unless data storage isc:tmp wand.spells[0] run return run scoreboard players set $spell.multicast isc.tmp 0


# Create a projectile with the spell data
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $clone_count isc.tmp = @s isc.clone
data modify storage isc:tmp rotation set from entity @s Rotation
scoreboard players remove $spell.multicast isc.tmp 1
# (storage "isc:tmp wand" is the same)

execute summon minecraft:marker run function isc:as_projectile/summon


# Apply offset
function isc:spells/multicast/offset


# Remove stored spells
data remove entity @s data.isc.spells


# Next projectile
execute unless score $spell.multicast isc.tmp matches 1.. run return 0
function isc:spells/multicast/cast
