#> [tick] as projectile, at @s


# Get caster's rotation
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[limit=1,type=#isc:caster,tag=isc.caster,tag=!isc.spectator,predicate=isc:match_id] run data modify storage isc:tmp rotation set from entity @s Rotation

execute store result score $target_r0 isc.tmp run data get storage isc:tmp rotation[0] 1
execute store result score $target_r1 isc.tmp run data get storage isc:tmp rotation[1] 1


# Update rotation
function isc:spells/homing/update_rot
