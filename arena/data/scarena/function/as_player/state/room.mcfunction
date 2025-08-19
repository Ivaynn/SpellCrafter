#> [tick] as player, at @s
# Executed if player is at a private room (state 2)


xp set @s 0 points
xp set @s 1 levels




# Triggers
scoreboard players enable @s arena
scoreboard players enable @s queue
scoreboard players enable @s spawn

execute if score @s arena matches 1.. run function scarena:as_player/state/join/arena
scoreboard players set @s arena 0

execute if score @s spawn matches 1.. run function scarena:as_player/state/join/lobby
scoreboard players set @s spawn 0
