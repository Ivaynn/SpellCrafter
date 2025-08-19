#> as marker OR player


# Find winner
scoreboard players operation $game_id scarena.tmp = @s scarena.player.game_id
execute as @a[scores={scarena.player.state=4}] if score @s scarena.player.game_id = $game_id scarena.tmp run function scarena:game/as_player/exit
