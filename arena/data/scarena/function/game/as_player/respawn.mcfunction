#> as player

scoreboard players remove @s scarena.game.lives 1

# Mark as dead
tag @s add scarena.game.dead
schedule function scarena:game/check_players 1t replace


# Has more lives: spectate
execute if score @s scarena.game.lives matches 1.. run return 0


# No more lives: exit game
tellraw @s ["",{text:"> ",color:"dark_purple",bold:true},{text:"You ran out of lives and lost the game!",color:"gray"}]
function scarena:game/as_player/exit
