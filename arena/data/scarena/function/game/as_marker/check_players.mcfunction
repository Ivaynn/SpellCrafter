#> as marker

scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
scoreboard players set $game.players scarena.tmp 0
execute as @a[scores={scarena.player.state=4}] if score @s scarena.game.id = $game.id scarena.tmp run scoreboard players add $game.players scarena.tmp 1
execute unless score $game.players scarena.tmp matches 2.. run function scarena:game/as_marker/end_game
