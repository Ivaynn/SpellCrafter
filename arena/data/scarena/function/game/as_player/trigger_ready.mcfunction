#> as player

scoreboard players set @s ready -1


scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
scoreboard players set $game.not_ready scarena.tmp 0
execute as @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] unless score @s ready matches -1 run scoreboard players add $game.not_ready scarena.tmp 1
tellraw @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] ["",{text:"> ",color:"dark_purple",bold:true},{selector:"@s",color:"gray"},{text:" is ready!",color:"gray"}]


# If not all players are ready -> cancel
execute if score $game.not_ready scarena.tmp matches 1.. run return 0


# If all players are ready -> skip timer to 5 sec
execute as @n[type=minecraft:marker,tag=scarena.game,predicate=scarena:match_game_id] if score @s scarena.game.timer matches 111.. run function scarena:game/as_player/trigger_ready_marker
