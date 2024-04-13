#> [tick] as projectile, at @s


# Tag the caster
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[distance=0.1..30,type=#isc:caster,tag=!isc.spectator] if score @s isc.id = $id isc.tmp run tag @s add isc.tmp


# Get rotation while facing the nearest target (excluding the caster)
execute store result score $homing isc.tmp run tp @s ~ ~-1 ~ facing entity @e[limit=1,distance=0.1..30,sort=nearest,type=!#isc:untargetable,tag=!isc.tmp,tag=!isc.spectator] feet
tag @e[distance=0.1..30,type=#isc:caster,tag=!isc.spectator] remove isc.tmp


# If no target was found, stop here
execute if score $homing isc.tmp matches 0 run return 0


# Save rotation while facing the target & reset rotation
execute store result score $target_r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $target_r1 isc.tmp run data get entity @s Rotation[1] 1


# Reset position & rotation to this function's context (at @s)
tp @s ~ ~ ~ ~ ~


# Update rotation
function isc:spells/homing/update_rot
