#> execute summon (marker)

tag @s add scarena.game
tag @s add scarena.game.loading

scoreboard players operation @s scarena.game.id = $new scarena.game.id
scoreboard players set @s scarena.game.round 0
scoreboard players operation @s scarena.game.timer = game.round_time scarena.main


# Find available slot
scoreboard players set @s scarena.game.slot 0
scoreboard players set $game.slot scarena.tmp 1
function scarena:game/new/for_slot
scoreboard players operation $game.slot scarena.tmp = @s scarena.game.slot
execute unless score @s scarena.game.slot matches 1.. run return run kill @s


# Convert slot id into arena coordinates
scoreboard players remove $game.slot scarena.tmp 1

scoreboard players operation $game.x scarena.tmp = $game.slot scarena.tmp
scoreboard players operation $game.x scarena.tmp %= #3 scarena.math

scoreboard players operation $game.z scarena.tmp = $game.slot scarena.tmp
scoreboard players operation $game.z scarena.tmp /= #3 scarena.math

scoreboard players add $game.slot scarena.tmp 1


# Convert room coordinates into world coordinates
scoreboard players remove $game.x scarena.tmp 1
scoreboard players operation $game.x scarena.tmp *= #1k scarena.math

scoreboard players operation $game.z scarena.tmp *= #1k scarena.math
scoreboard players add $game.z scarena.tmp 1000


# Save arena coords to entity
scoreboard players operation @s scarena.game.x = $game.x scarena.tmp
scoreboard players operation @s scarena.game.z = $game.z scarena.tmp


# Schedule structure load
data modify storage scarena:queue structures append value {name:"", x:0, z:1000, game: true}
execute store result storage scarena:queue structures[-1].x int 1 run scoreboard players get $game.x scarena.tmp
execute store result storage scarena:queue structures[-1].z int 1 run scoreboard players get $game.z scarena.tmp

execute store result score $game.random scarena.tmp run random value 1..3
execute if score $game.random scarena.tmp matches 1 run data modify storage scarena:queue structures[-1].name set value "arena/1"
execute if score $game.random scarena.tmp matches 2 run data modify storage scarena:queue structures[-1].name set value "arena/2"
execute if score $game.random scarena.tmp matches 3 run data modify storage scarena:queue structures[-1].name set value "arena/3"

schedule function scarena:structure/schedule 1t replace
