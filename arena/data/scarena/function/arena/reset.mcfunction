# This is hardcoded for a 96x96 arena at X=1000, Z=0


# 18k ticks = 15min
scoreboard players operation arena.timer scarena.main = arena.interval scarena.main


# Teleport players
execute as @a if score @s scarena.player.state matches 3 at @s run function scarena:as_player/state/join/lobby


# Kill non-players
execute as @e[type=!minecraft:player,x=950,dx=1050,z=-50,dz=100,y=-100,dy=200] at @s run function scarena:arena/remove_entity


# Schedule structure load
data modify storage scarena:queue structures append value {name:"arena/1", x:1000, z:0}
schedule function scarena:structure/schedule 1t replace


# Complete
tellraw @a ["",{text:"> ",color:"dark_green",bold:true},{text:"The FFA arena is resetting...",color:"gray"}]
