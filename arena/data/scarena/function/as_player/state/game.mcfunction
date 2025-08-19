#> [tick] as player, at @s
# Executed if player is in-game (state 4)


# Triggers
scoreboard players enable @s surrender

execute if score @s surrender matches 1.. run function scarena:game/as_player/surrender
scoreboard players set @s surrender 0
