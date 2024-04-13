#> as projectile, on summon, at @s


# Remove tag
tag @s remove isc.duplicate


# Get relevant data to create a copy
data modify storage isc:tmp copy.isc set from entity @s data.isc
data modify storage isc:tmp copy.tags set from entity @s Tags
data modify storage isc:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $age isc.tmp = @s isc.age
scoreboard players operation $speed isc.tmp = @s isc.speed
scoreboard players operation $range isc.tmp = @s isc.range
scoreboard players operation $blind isc.tmp = @s isc.blind


# Rotation offset for V shape
tp @s ~ ~ ~ ~10 ~


# Summon copy
execute summon minecraft:marker run function isc:spells/duplicate/summon_copy
