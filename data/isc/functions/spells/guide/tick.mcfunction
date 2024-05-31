#> [tick] as projectile, at @s


# Return if speed is 0
execute if score @s isc.speed matches 0 run return 0


# Get caster's rotation
scoreboard players operation $id isc.tmp = @s isc.id
data modify entity @s Rotation set from entity @e[limit=1,type=#isc:caster,tag=isc.caster,tag=!isc.spectator,predicate=isc:match_id] Rotation 


# Negative speed
execute if score @s isc.speed matches ..-1 at @s run tp @s ~ ~ ~ facing ^ ^ ^-1


# Save rotation
execute store result score $target_r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $target_r1 isc.tmp run data get entity @s Rotation[1] 1


# Reset position & rotation to this function's context (at @s)
tp @s ~ ~ ~ ~ ~


# Update rotation
function isc:spells/homing/update_rot
