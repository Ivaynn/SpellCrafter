
# Tag caster
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[distance=0.1..50,type=#isc:caster,tag=!isc.spectator] if score @s isc.id = $id isc.tmp run tag @s add isc.tmp


# Get rotation while facing the target
execute store result score $homing isc.tmp run tp @s ~ ~-1 ~ facing entity @e[limit=1,distance=0.1..50,sort=nearest,type=!#isc:untargetable,tag=!isc.tmp,tag=!isc.spectator] feet
tag @e[distance=0.1..50,type=#isc:caster,tag=!isc.spectator] remove isc.tmp
execute if score $homing isc.tmp matches 0 run return 0

execute store result score $target_r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $target_r1 isc.tmp run data get entity @s Rotation[1] 1
tp @s ~ ~ ~ ~ ~


# Get current rotation
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 isc.tmp run data get entity @s Rotation[1] 1


# Vertical rotation
scoreboard players operation $target_r1 isc.tmp -= $r1 isc.tmp

execute if score $target_r1 isc.tmp matches 11.. run scoreboard players set $target_r1 isc.tmp 10
execute if score $target_r1 isc.tmp matches ..-11 run scoreboard players set $target_r1 isc.tmp -10

scoreboard players operation $r1 isc.tmp += $target_r1 isc.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 isc.tmp


# Horizontal rotation
scoreboard players operation $target_r0 isc.tmp -= $r0 isc.tmp

execute if score $target_r0 isc.tmp matches 11..179 run scoreboard players set $target_r0 isc.tmp 10
execute if score $target_r0 isc.tmp matches 180.. run scoreboard players set $target_r0 isc.tmp -10
execute if score $target_r0 isc.tmp matches -179..-11 run scoreboard players set $target_r0 isc.tmp -10
execute if score $target_r0 isc.tmp matches ..-180 run scoreboard players set $target_r0 isc.tmp 10

scoreboard players operation $r0 isc.tmp += $target_r0 isc.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
