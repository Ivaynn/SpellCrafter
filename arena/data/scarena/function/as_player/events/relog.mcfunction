#> as player, at @s

execute if score @s scarena.player.state matches 1..3 run function scarena:as_player/state/join/lobby
execute if score @s scarena.player.state matches 4 run function scarena:game/as_player/relog
