#> as player

scoreboard players remove @s scarena.game.lives 1


# Has more lives: spectate
execute if score @s scarena.game.lives matches 1.. run return run gamemode spectator @s


# No more lives: exit game
tellraw @s ["",{text:"> ",color:"dark_purple",bold:true},{text:"You ran out of lives and lost the game!",color:"gray"}]
function scarena:game/as_player/exit
