

# Get caster's rotation
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[type=#isc:caster,tag=!isc.spectator] if score @s isc.id = $id isc.tmp run data modify storage isc:tmp copy.rotation set from entity @s Rotation

execute store result score $caster_r0 isc.tmp run data get storage isc:tmp copy.rotation[0] 1
execute store result score $caster_r1 isc.tmp run data get storage isc:tmp copy.rotation[1] 1


# Get current rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1


# Vertical rotation
scoreboard players operation $caster_r1 isc.tmp -= $r1 isc.tmp

execute if score $caster_r1 isc.tmp matches 11.. run scoreboard players set $caster_r1 isc.tmp 10
execute if score $caster_r1 isc.tmp matches ..-11 run scoreboard players set $caster_r1 isc.tmp -10

scoreboard players operation $r1 isc.tmp += $caster_r1 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp


# Horizontal rotation
scoreboard players operation $caster_r0 isc.tmp -= $r0 isc.tmp

execute if score $caster_r0 isc.tmp matches 11..179 run scoreboard players set $caster_r0 isc.tmp 10
execute if score $caster_r0 isc.tmp matches 180.. run scoreboard players set $caster_r0 isc.tmp -10
execute if score $caster_r0 isc.tmp matches -179..-11 run scoreboard players set $caster_r0 isc.tmp -10
execute if score $caster_r0 isc.tmp matches ..-180 run scoreboard players set $caster_r0 isc.tmp 10

scoreboard players operation $r0 isc.tmp += $caster_r0 isc.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
