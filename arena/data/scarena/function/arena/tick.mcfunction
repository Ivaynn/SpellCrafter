#> [tick]


scoreboard players remove arena_reset scarena.main 1
execute unless score arena_reset scarena.main matches 1.. run function scarena:arena/reset

execute if score arena_reset scarena.main matches 600 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 30 seconds",color:"gray"}]
execute if score arena_reset scarena.main matches 200 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 10 seconds",color:"gray"}]
execute if score arena_reset scarena.main matches 100 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 5 seconds",color:"gray"}]
execute if score arena_reset scarena.main matches 80 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 4 seconds",color:"gray"}]
execute if score arena_reset scarena.main matches 60 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 3 seconds",color:"gray"}]
execute if score arena_reset scarena.main matches 40 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 2 seconds",color:"gray"}]
execute if score arena_reset scarena.main matches 20 run tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena will reset in 1 second",color:"gray"}]
