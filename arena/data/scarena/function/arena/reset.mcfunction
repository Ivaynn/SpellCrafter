# This is hardcoded for a 96x96 arena at X=1000, Z=0


# 18k ticks = 15min
scoreboard players set arena_reset scarena.main 18000


# Teleport players
execute as @a if score @s scarena.player.state matches 2 at @s run function scarena:as_player/state/join/lobby


# Kill non-players



# Load structures
data modify storage scarena:tmp structure set value {name:"arena/1", x:1000, z:0}
function scarena:structure/load with storage scarena:tmp structure


# Complete
tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena was reset",color:"gray"}]
