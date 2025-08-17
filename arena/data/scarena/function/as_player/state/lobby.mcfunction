#> [tick] as player, at @s
# Executed if player is at spawn (state 1)


# Manage player
scoreboard players set @s spellcrafter.cooldown 21


# Prevent inventory use
function scarena:as_player/inventory_locked


# Triggers
scoreboard players enable @s arena
scoreboard players enable @s private
scoreboard players enable @s queue
scoreboard players enable @s spectator
scoreboard players enable @s spawn

execute if score @s arena matches 1.. run function scarena:as_player/state/join/arena
scoreboard players set @s arena 0

execute if score @s spectator matches 1.. run function scarena:as_player/state/join/spectator
scoreboard players set @s spectator 0

execute if score @s spawn matches 1.. run function scarena:as_player/state/join/lobby
scoreboard players set @s spawn 0

execute if score @s private matches 1.. run function scarena:as_player/state/join/private
scoreboard players set @s private 0
