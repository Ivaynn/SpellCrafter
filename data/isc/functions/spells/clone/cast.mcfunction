#> as projectile, on summon, at @s


# Check projectile cap
scoreboard players operation $projectile_count isc.tmp += $spell.clone isc.tmp
execute if score $projectile_count isc.tmp > projectile_cap isc.options run return 0


# Get relevant data to create a copy
data modify storage isc:tmp copy.isc set from entity @s data.isc
data modify storage isc:tmp copy.tags set from entity @s Tags
data modify storage isc:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $age isc.tmp = @s isc.age
scoreboard players operation $speed isc.tmp = @s isc.speed
scoreboard players operation $range isc.tmp = @s isc.range
scoreboard players operation $blind isc.tmp = @s isc.blind


# Starting rotation offset
scoreboard players set $r0_offset isc.tmp 10
scoreboard players operation $r0_offset isc.tmp *= $spell.clone isc.tmp

execute store result score $r0 isc.tmp run data get storage isc:tmp copy.rotation[0] 1
scoreboard players operation $r0 isc.tmp -= $r0_offset isc.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp


# Summon the clones
execute at @s run function isc:spells/clone/for_clone
