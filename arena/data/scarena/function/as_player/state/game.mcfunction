#> [tick] as player, at @s
# Executed if player is in-game (state 4)


# Void death
execute at @s unless entity @s[y=-61,dy=128] run damage @s 1000000 minecraft:out_of_world


# Triggers
scoreboard players enable @s surrender

execute if score @s surrender matches 1.. run function scarena:game/as_player/surrender
scoreboard players set @s surrender 0
