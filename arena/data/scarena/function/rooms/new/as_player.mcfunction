#> as player, at @s


# Player already has a room -> reset it
execute if score @s scarena.player.room_id matches 1.. run return run function scarena:rooms/new/load


# Player doesn't have a room -> find an available one
scoreboard players set @s scarena.player.room_id 0
scoreboard players set $room.id scarena.tmp 1
function scarena:rooms/new/for_room_id
execute unless score @s scarena.player.room_id matches 1.. run return run function scarena:rooms/new/fail
function scarena:rooms/new/load
