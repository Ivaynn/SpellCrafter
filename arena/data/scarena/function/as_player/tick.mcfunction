#> [tick] as player, at @s


# Scoreboard events
execute unless score @s scarena.player.relog matches 0.. run function scarena:as_player/events/first_join
execute if score @s scarena.player.relog matches 1.. run function scarena:as_player/events/relog
execute if score @s scarena.player.death matches 1.. run function scarena:as_player/events/respawn
scoreboard players set @s scarena.player.relog 0
scoreboard players set @s scarena.player.death 0


# State 0 or undefined: new player -> default to 1
execute unless score @s scarena.player.state matches 1.. run scoreboard players set @s scarena.player.state 1


# State 1: at lobby
execute if score @s scarena.player.state matches 1 run function scarena:as_player/state/lobby


# State 2: at arena
execute if score @s scarena.player.state matches 2 run function scarena:as_player/state/arena


# State 3: at FFA arena
execute if score @s scarena.player.state matches 3 run say private


# State 4: at game arena
execute if score @s scarena.player.state matches 4 run say in-game
