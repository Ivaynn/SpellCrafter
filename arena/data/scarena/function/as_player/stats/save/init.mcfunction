#> as player

data modify storage scarena:stats entry set value {id:0}

execute store result storage scarena:stats entry.id int 1 run scoreboard players get @s scarena.player.id

execute store result storage scarena:stats entry.time int 1 run scoreboard players get @s scarena.stats.time

execute store result storage scarena:stats entry.games_played int 1 run scoreboard players get @s scarena.stats.game.count
execute store result storage scarena:stats entry.games_won int 1 run scoreboard players get @s scarena.stats.game.wins

execute store result storage scarena:stats entry.game_kills int 1 run scoreboard players get @s scarena.stats.game.kills
execute store result storage scarena:stats entry.game_deaths int 1 run scoreboard players get @s scarena.stats.game.deaths

execute store result storage scarena:stats entry.arena_kills int 1 run scoreboard players get @s scarena.stats.arena.kills
execute store result storage scarena:stats entry.arena_deaths int 1 run scoreboard players get @s scarena.stats.arena.deaths

tag @s add scarena.tmp
execute at @s summon minecraft:text_display run function scarena:as_player/stats/save/get_name
tag @s remove scarena.tmp

function scarena:as_player/stats/save/macro with storage scarena:stats entry
