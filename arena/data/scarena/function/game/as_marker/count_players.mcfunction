#> as marker OR player

scoreboard players operation $game_id scarena.tmp = @s scarena.player.game_id
scoreboard players set $game.players scarena.tmp 1
execute as @a[scores={scarena.player.state=4}] if score @s scarena.player.game_id = $game_id scarena.tmp run scoreboard players add $game.players scarena.tmp 1
execute unless score $game.players scarena.tmp matches 2.. run function scarena:game/as_marker/end_game
