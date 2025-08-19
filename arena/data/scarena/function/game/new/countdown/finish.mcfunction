#> any
scoreboard players set queue.timer scarena.main 0


# Count players
function scarena:as_player/queue/update_count
execute unless score queue.players scarena.main >= queue.min_players scarena.main run return run tellraw @a ["",{text:"> ",color:"red",bold:true},{text:"Failed to start: there are not enough players!",color:"gray"}]
execute unless score queue.players scarena.main <= queue.max_players scarena.main run return run tellraw @a ["",{text:"> ",color:"red",bold:true},{text:"Failed to start: there are too many players!",color:"gray"}]


# Count running games
function scarena:game/instance_count
execute unless score game.instances scarena.main < game.max_instances scarena.main run return run tellraw @a ["",{text:"> ",color:"red",bold:true},{text:"Failed to start: there are too many games running already! Please try again later.",color:"gray"}]


# Start game
tellraw @a ["",{text:"> ",color:"dark_purple",bold:true},{text:"A new game has started with ",color:"gray"},{score:{name:"queue.players",objective:"scarena.main"},color:"gray"},{text:" players!",color:"gray"}]
function scarena:game/new/init
