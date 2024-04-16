#> as projectile, on summon, at @s


# Check projectile cap
scoreboard players operation $projectile_count isc.tmp += $spell.multishot isc.tmp
scoreboard players operation $projectile_count isc.tmp += $spell.multishot isc.tmp
execute if score $projectile_count isc.tmp > projectile_cap isc.options run return 0


# Multicast
execute as @s[tag=isc.spell.multicast] run data remove entity @s data.isc


# Get relevant data to create a copy
data remove storage isc:tmp copy
data modify storage isc:tmp copy.tags set from entity @s Tags
data modify storage isc:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $age isc.tmp = @s isc.age
scoreboard players operation $speed isc.tmp = @s isc.speed
scoreboard players operation $range isc.tmp = @s isc.range
scoreboard players operation $blind isc.tmp = @s isc.blind


# Summon copies
execute store result score $r0 isc.tmp run data get storage isc:tmp copy.rotation[0] 1
function isc:spells/multishot/for_copy
