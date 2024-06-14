#> [tick] as projectile, at @s


# Get rotation while facing the caster
scoreboard players operation $id isc.tmp = @s isc.id
execute store result score $spell.follow isc.tmp run tp @s ~ ~-1 ~ facing entity @e[limit=1,distance=0.1..15,sort=nearest,type=#isc:caster,tag=isc.caster,predicate=isc:match_id,tag=!isc.spectator] feet


# If no target was found, stop here
execute if score $spell.follow isc.tmp matches 0 run return 0


# Negative speed
execute if score @s isc.speed matches ..-1 at @s run tp @s ~ ~ ~ facing ^ ^ ^-1


# Save rotation
execute store result score $target_r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $target_r1 isc.tmp run data get entity @s Rotation[1] 1


# Reset position & rotation to this function's context (at @s)
tp @s ~ ~ ~ ~ ~


# Update rotation
function isc:spells/homing/update_rot
