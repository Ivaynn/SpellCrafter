#> any
scoreboard players set queue_timer scarena.main 0


# Count players
scoreboard players set $queue.players scarena.tmp 1
execute as @a if score @s scarena.player.game_id matches -1 run scoreboard players add $queue.players scarena.tmp 1
execute unless score $queue.players scarena.tmp matches 2.. run return run tellraw @a ["",{text:"> ",color:"dark_purple",bold:true},{text:"Not enough players to start the game!",color:"gray"}]


# Start game
tellraw @a ["",{text:"> ",color:"dark_purple",bold:true},{text:"A new game has started with ",color:"gray"},{score:{name:"$queue.players",objective:"scarena.tmp"},color:"gray"},{text:" players!",color:"gray"}]
function scarena:game/new/init
