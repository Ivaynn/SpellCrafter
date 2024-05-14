#> as projectile, on summon, at the summon position (not at @s)
#> recursive function (limited by score "$spell.remote_cast isc.tmp")


# Save current rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1000
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1000


# Get starting rotation
data modify entity @s Rotation set from storage isc:tmp rotation


# Iterate
function isc:spells/remote_cast/for_cast


# Return saved rotation at the end
execute store result entity @s Rotation[0] float .001 run scoreboard players get $r0 isc.tmp
execute store result entity @s Rotation[1] float .001 run scoreboard players get $r1 isc.tmp
