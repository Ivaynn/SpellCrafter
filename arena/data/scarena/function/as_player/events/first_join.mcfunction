#> as player, at @s

scoreboard players set @s stats -1
scoreboard players add $new scarena.player.id 1
scoreboard players operation @s scarena.player.id = $new scarena.player.id
function scarena:as_player/state/join/lobby
