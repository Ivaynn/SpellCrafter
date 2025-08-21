#> as marker


# Reset all players
execute as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] run function scarena:game/as_player/win


# Remove forceloaded chunks
execute store result entity @s Pos[0] double 1 run scoreboard players get @s scarena.game.x
execute store result entity @s Pos[2] double 1 run scoreboard players get @s scarena.game.z
execute at @s run forceload remove ~48 ~48 ~-49 ~-49


# Remove game manager entity
kill @s
