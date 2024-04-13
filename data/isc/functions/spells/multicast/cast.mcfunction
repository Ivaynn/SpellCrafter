#> as projectile, on summon, at @s
#> recursive function (limited by length of storage "isc:tmp wand.spells")


# Remove tag
tag @s remove isc.spell.multicast


# Create a projectile with the spell data
scoreboard players operation $id isc.tmp = @s isc.id
data modify storage isc:tmp copy.rotation set from entity @s Rotation
# (storage "isc:tmp wand.spells" is the same)

scoreboard players set $multicast isc.tmp 1
execute summon minecraft:marker run function isc:as_projectile/summon
scoreboard players set $multicast isc.tmp 0


# Remove stored spells
data remove entity @s data.isc.spells


# Next projectile
execute if data storage isc:tmp wand.spells[0] run function isc:spells/multicast/cast
