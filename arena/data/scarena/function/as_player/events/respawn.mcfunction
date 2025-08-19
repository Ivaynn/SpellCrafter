#> as player, at ...
# if doImmediateRespawn is true  -> at respawn pos
# if doImmediateRespawn is false -> at death pos


# Room death -> teleport back to room
execute if score @s scarena.player.state matches 2 run return run function scarena:rooms/new/tp_player


# Default -> Go to lobby
function scarena:as_player/state/join/lobby
