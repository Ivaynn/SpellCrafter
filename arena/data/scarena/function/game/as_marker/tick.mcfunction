#> [tick] as marker


scoreboard players add @s scarena.game.timer 1

execute if score @s scarena.game.timer matches 200.. run function scarena:game/as_marker/next_round
execute if score @s scarena.game.timer matches 200.. run scoreboard players set @s scarena.game.timer 0
