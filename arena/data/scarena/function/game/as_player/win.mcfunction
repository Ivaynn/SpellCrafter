#> as player

scoreboard players add @s scarena.player.wins 1
tellraw @a ["\n",{text:"> ",color:"dark_purple",bold:true},{selector:"@s",color:"gray"},{text:" won the game! Total wins: ",color:"gray"},{score:{name:"@s",objective:"scarena.player.wins"},color:"gray"},"\n"]
function scarena:game/as_player/exit
