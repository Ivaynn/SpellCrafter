#> as server (scheduled)


# If queue is empty, exit
execute unless data storage scarena:queue structures run return run data modify storage scarena:queue structures set value []
execute unless data storage scarena:queue structures[0] run return run data modify storage scarena:queue structures set value []


# Process this queue entry
scoreboard players set $success scarena.tmp 1
function scarena:structure/load with storage scarena:queue structures[0]


# Fail message
execute if score $success scarena.tmp matches 0 run tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Failed to place structure: ",color:"gray"},{storage:"scarena:queue",nbt:"structures[0]",color:"white"}]
execute if score $success scarena.tmp matches 1 run tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Placed structure: ",color:"gray"},{storage:"scarena:queue",nbt:"structures[0]",color:"white"}]


# If game structure, run final game load stage
execute if score $success scarena.tmp matches 1 if data storage scarena:queue structures[0].game run schedule function scarena:game/new/finish 1t


# Clear queue entry if successful
execute if score $success scarena.tmp matches 1 run data remove storage scarena:queue structures[0]


# If queue is not empty, schedule next structure
execute if data storage scarena:queue structures[0] run schedule function scarena:structure/schedule 5t replace
