#> as player


# Ready!
execute as @s[tag=scarena.game.ready] run tellraw @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] ["",{text:"> ",color:"dark_purple",bold:true},{selector:"@s",color:"gray"},{text:" is not ready...",color:"gray"}]
execute as @s[tag=scarena.game.ready] run return run tag @s remove scarena.game.ready


# Not ready...
tellraw @a[scores={scarena.player.state=4},predicate=scarena:match_game_id] ["",{text:"> ",color:"dark_purple",bold:true},{selector:"@s",color:"gray"},{text:" is ready!",color:"gray"}]
tag @s add scarena.game.ready
