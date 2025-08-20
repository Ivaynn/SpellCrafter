#> as marker

scoreboard players operation $game.id scarena.tmp = @s scarena.game.id

scoreboard players set $game.players scarena.tmp 0
execute as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] if score @s scarena.game.id = $game.id scarena.tmp run scoreboard players add $game.players scarena.tmp 1
execute unless score $game.players scarena.tmp matches 2.. run return run function scarena:game/as_marker/end_game

scoreboard players set $game.players.alive scarena.tmp 0
execute as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id,tag=!scarena.game.dead] run scoreboard players add $game.players.alive scarena.tmp 1
execute unless score $game.players.alive scarena.tmp matches 2.. if score @s scarena.game.timer matches 66.. run scoreboard players set @s scarena.game.timer 65
