#> [tick]

scoreboard players add queue.timer scarena.main 1
execute if score queue.timer scarena.main matches 100 run tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{text:"A new game is starting in 5 seconds!",color:"gray"}]
execute if score queue.timer scarena.main matches 120 run tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{text:"A new game is starting in 4 seconds!",color:"gray"}]
execute if score queue.timer scarena.main matches 140 run tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{text:"A new game is starting in 3 seconds!",color:"gray"}]
execute if score queue.timer scarena.main matches 160 run tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{text:"A new game is starting in 2 seconds!",color:"gray"}]
execute if score queue.timer scarena.main matches 180 run tellraw @a [{text:"",hover_event:{action:"show_text",value:{text:"Click to join!",color:"gray"}},click_event:{action:"run_command",command:"trigger queue set 2"}},{text:"> ",color:"dark_purple",bold:true},{text:"A new game is starting in 1 second!",color:"gray"}]
execute if score queue.timer scarena.main matches 200 run function scarena:game/new/countdown/finish
