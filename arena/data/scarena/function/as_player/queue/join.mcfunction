#> as player

function scarena:as_player/queue/update_count
execute if score queue.players scarena.main >= queue.max_players scarena.main run return run tellraw @s ["",{text:"> ",color:"dark_purple",bold:true},{text:"The queue is full! Please wait for the current game to start.",color:"gray"}]

execute if score @s scarena.player.game_id matches -1 run return run tellraw @s ["",{text:"> ",color:"dark_purple",bold:true},{text:"You're already in the queue!",color:"gray"}]
execute unless score @s scarena.player.game_id matches -1 run tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{selector:"@s",color:"gray"},{text:" has joined the queue!",color:"gray"}]

scoreboard players set @s scarena.player.game_id -1
scoreboard players add queue.players scarena.main 1
function scarena:game/new/countdown/init
