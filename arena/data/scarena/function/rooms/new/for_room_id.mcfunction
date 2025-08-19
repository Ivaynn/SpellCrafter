#> as player, at @s
# Recursive function (limited by score "$room.id scarena.tmp")


# Get unused room ID
scoreboard players set $room.new scarena.tmp 1
execute as @a[scores={scarena.player.state=2}] if score @s scarena.player.room_id = $room.id scarena.tmp run scoreboard players set $room.new scarena.tmp 0
execute if score $room.new scarena.tmp matches 1 run return run scoreboard players operation @s scarena.player.room_id = $room.id scarena.tmp


# Next iteration
scoreboard players add $room.id scarena.tmp 1
execute unless score $room.id scarena.tmp >= room.max_count scarena.main run function scarena:rooms/new/for_room_id
