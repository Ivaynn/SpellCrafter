#> as server (scheduled)


# If queue is empty, exit
execute unless data storage scarena:queue rooms run return run data modify storage scarena:queue rooms set value []
execute unless data storage scarena:queue rooms[0] run return run data modify storage scarena:queue rooms set value []


# Process this queue entry
scoreboard players set $success scarena.tmp 1
execute store result score $room.id scarena.tmp run data get storage scarena:queue rooms[0].id
function scarena:rooms/structure/load_macro with storage scarena:queue rooms[0]


# Fail message
execute if score $success scarena.tmp matches 0 run tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Failed to place room: ",color:"gray"},{storage:"scarena:queue",nbt:"rooms[0]",color:"white"}]
execute if score $success scarena.tmp matches 1 run tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Placed room: ",color:"gray"},{storage:"scarena:queue",nbt:"rooms[0]",color:"white"}]


# Clear queue entry if successful
execute if score $success scarena.tmp matches 1 run data remove storage scarena:queue rooms[0]


# If queue is not empty, schedule next structure
execute if data storage scarena:queue rooms[0] run schedule function scarena:rooms/structure/schedule 5t replace
