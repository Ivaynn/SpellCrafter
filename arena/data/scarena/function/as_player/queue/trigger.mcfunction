#> as player


# Already in-game -> ignore
execute if score @s scarena.player.game_id matches 1.. run return 0


# Case 2 -> always join
execute if score @s queue matches 2 run return run function scarena:as_player/queue/join


# Case 3 -> always leave
execute if score @s queue matches 3 run return run function scarena:as_player/queue/leave


# Otherwise -> toggle join/leave
execute if score @s scarena.player.game_id matches -1 run return run function scarena:as_player/queue/leave
function scarena:as_player/queue/join
