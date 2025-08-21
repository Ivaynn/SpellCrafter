#> as player


execute unless score $game.round scarena.tmp matches 3.. run tellraw @s ["\n",{text:"> ",color:"dark_purple",bold:true},{text:"The game ended too soon! There are no winners.",color:"gray"},"\n"]
execute unless score $game.round scarena.tmp matches 3.. run return run function scarena:game/as_player/exit


scoreboard players add @s scarena.stats.game.wins 1
tellraw @a ["\n",{text:"> ",color:"dark_purple",bold:true},{selector:"@s",color:"gray"},{text:" won the game! Total wins: ",color:"gray"},{score:{name:"@s",objective:"scarena.stats.game.wins"},color:"gray"},"\n"]
function scarena:game/as_player/exit
