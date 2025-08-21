#> as player

scoreboard players set @s ready 0
scoreboard players enable @s ready
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id

function scarena:game/as_player/ready/toggle
scoreboard players set $game.not_ready scarena.tmp 0
execute as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id,tag=!scarena.game.ready] run scoreboard players add $game.not_ready scarena.tmp 1


# If not all players are ready -> cancel
execute if score $game.not_ready scarena.tmp matches 1.. run return 0


# If all players are ready -> skip timer to 5 sec
execute as @n[type=minecraft:marker,tag=scarena.game,predicate=scarena:match_game_id] if score @s scarena.game.timer matches 111.. run function scarena:game/as_player/ready/as_marker
