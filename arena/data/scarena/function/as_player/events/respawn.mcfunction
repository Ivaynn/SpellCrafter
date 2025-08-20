#> as player, at ...
# if doImmediateRespawn is true  -> at respawn pos
# if doImmediateRespawn is false -> at death pos


# Permanent effects
effect give @s minecraft:saturation infinite 100 true


# Stats
scoreboard players add @s[scores={scarena.player.state=3}] scarena.stats.arena.deaths 1
scoreboard players add @s[scores={scarena.player.state=4}] scarena.stats.game.deaths 1


# Room death -> teleport back to room
execute if score @s scarena.player.state matches 2 run return run function scarena:rooms/new/tp_player


# Game death -> let the game system handle it
execute if score @s scarena.player.state matches 4 run return run function scarena:game/as_player/respawn


# Default -> Go to lobby
function scarena:as_player/state/join/lobby
