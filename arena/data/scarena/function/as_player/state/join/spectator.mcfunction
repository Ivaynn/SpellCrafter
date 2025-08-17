#> as player, at @s
scoreboard players set @s scarena.player.state 1
function scarena:as_player/disable_triggers


# Disable spectator
execute as @s[gamemode=spectator] run return run function scarena:as_player/state/join/lobby


# Enable spectator
gamemode spectator @s
tp @s @a[limit=1,sort=random,gamemode=!spectator]
