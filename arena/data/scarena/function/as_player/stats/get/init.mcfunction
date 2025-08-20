#> as player


# Default to own stats and error if id is not valid
execute if score @s stats matches 0 run scoreboard players operation @s stats = @s scarena.player.id
execute if score @s stats > $new scarena.player.id run return run tellraw @a ["",{text:"> ",color:"red",bold:true},{text:"Invalid player ID!",color:"gray"}]


# Update stats if target player is online
scoreboard players operation $stats.id scarena.tmp = @s stats
execute as @a if score @s scarena.player.id = $stats.id scarena.tmp run function scarena:as_player/stats/save/init


# Get stats for the player
data modify storage scarena:stats entry set value {id:0}
execute store result storage scarena:stats entry.id int 1 run scoreboard players get @s stats
function scarena:as_player/stats/get/macro with storage scarena:stats entry


# Display stats
tellraw @s ["\n  ",{text:"SpellCrafter Stats",color:"#965ed6"},"\n"]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Player: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.name",color:white},{text:" (",color:"gray"},{storage:"scarena:stats",nbt:"entry.id",color:gray},{text:")",color:"gray"}]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Arena Kills: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.arena_kills",color:white}]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Arena Deaths: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.arena_deaths",color:white}]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Games Won: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.games_won",color:white}]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Games Played: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.games_played",color:white}]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Game Kills: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.game_kills",color:white}]
tellraw @s ["",{text:" • ",color:dark_gray},{text:"Game Deaths: ",color:"gray"},{storage:"scarena:stats",nbt:"entry.game_deaths",color:white}]
