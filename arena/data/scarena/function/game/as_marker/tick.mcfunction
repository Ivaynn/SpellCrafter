#> [tick] as marker


scoreboard players remove @s scarena.game.timer 1

execute unless score @s scarena.game.timer matches 1.. run function scarena:game/as_marker/next_round

scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
execute if score @s scarena.game.timer matches 100 as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.6
execute if score @s scarena.game.timer matches 80 as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.6
execute if score @s scarena.game.timer matches 60 as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.6
execute if score @s scarena.game.timer matches 40 as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.6
execute if score @s scarena.game.timer matches 20 as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.6
