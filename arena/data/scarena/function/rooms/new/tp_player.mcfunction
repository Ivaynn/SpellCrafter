#> as player, at @s

execute unless score @s scarena.player.room_id matches 1.. run return 0

scoreboard players operation $room.id scarena.tmp = @s scarena.player.room_id
function scarena:rooms/new/get_coords

data modify storage scarena:tmp tp set value {x:0,z:0}
execute store result storage scarena:tmp tp.x int 1 run scoreboard players get $room.x scarena.tmp
execute store result storage scarena:tmp tp.z int 1 run scoreboard players get $room.z scarena.tmp
function scarena:rooms/new/tp_macro with storage scarena:tmp tp

effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true
