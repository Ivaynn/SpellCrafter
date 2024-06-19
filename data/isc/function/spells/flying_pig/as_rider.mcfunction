#> [tick] as pig's rider

execute if score $has_rider isc.tmp matches 1 run return 0
scoreboard players set $has_rider isc.tmp 1

execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
execute store result score $mx isc.tmp run data get entity @s Motion[0] 1000
execute store result score $mz isc.tmp run data get entity @s Motion[2] 1000
