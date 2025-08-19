#> any


# Count players
scoreboard players set $queue.players scarena.tmp 1
execute as @a if score @s scarena.player.game_id matches -1 run scoreboard players add $queue.players scarena.tmp 1
execute unless score $queue.players scarena.tmp matches 2.. run return 0


# Start timer
execute if score queue_timer scarena.main matches 1.. run return 0
scoreboard players set queue_timer scarena.main 1
tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{text:"A new game is starting in 10 seconds!",color:"gray"}]
