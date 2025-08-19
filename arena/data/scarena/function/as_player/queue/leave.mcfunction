#> as player

execute if score @s scarena.player.game_id matches 0 run tellraw @s ["",{text:"> ",color:"dark_purple",bold:true},{text:"You're not in the queue!",color:"gray"}]
execute unless score @s scarena.player.game_id matches 0 run tellraw @s ["",{text:"> ",color:"dark_purple",bold:true},{text:"You have left the queue!",color:"gray"}]
scoreboard players set @s scarena.player.game_id 0
function scarena:as_player/queue/update_count
