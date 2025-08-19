#> as player, at @s
# Input: "$room.id scarena.tmp"
# Output: "$room.x scarena.tmp", "$room.z scarena.tmp"


# Convert room id into room coordinates
scoreboard players remove $room.id scarena.tmp 1

scoreboard players operation $room.x scarena.tmp = $room.id scarena.tmp
scoreboard players operation $room.x scarena.tmp %= #3 scarena.math

scoreboard players operation $room.z scarena.tmp = $room.id scarena.tmp
scoreboard players operation $room.z scarena.tmp /= #3 scarena.math

scoreboard players add $room.id scarena.tmp 1


# Convert room coordinates into world coordinates
scoreboard players remove $room.x scarena.tmp 1
scoreboard players operation $room.x scarena.tmp *= #48 scarena.math

scoreboard players operation $room.z scarena.tmp *= #n1 scarena.math
scoreboard players operation $room.z scarena.tmp *= #48 scarena.math
scoreboard players remove $room.z scarena.tmp 1024
