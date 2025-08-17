#> as player, at ...
# if doImmediateRespawn is true  -> at respawn pos
# if doImmediateRespawn is false -> at death pos


# FFA arena death -> change state to 1 (lobby)
execute if score @s scarena.player.state matches 1..3 run function scarena:as_player/state/join/lobby
