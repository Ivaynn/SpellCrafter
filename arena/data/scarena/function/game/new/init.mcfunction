#> any

scoreboard players add $new scarena.player.game_id 1
execute as @a[scores={scarena.player.game_id=-1}] at @s run function scarena:game/new/as_player
