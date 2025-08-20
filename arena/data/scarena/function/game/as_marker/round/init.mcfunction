#> as marker, at arena center
scoreboard players operation @s scarena.game.timer = game.round_time scarena.main


execute positioned ~ ~-32 ~ as @e[type=!minecraft:player,distance=..200] at @s run function scarena:arena/remove_entity
fill ~13 -14 ~13 ~-13 -2 ~-13 minecraft:air replace

scoreboard players set $game.player.slot scarena.tmp 0
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id

fill ~47 ~-48 ~47 ~-48 ~-48 ~-48 minecraft:air
spreadplayers ~ ~ 1 100 under -20 false @a[predicate=scarena:match_game_id]
fill ~47 ~-48 ~47 ~-48 ~-48 ~-48 minecraft:barrier


# Players
scoreboard players set $game.player.slot scarena.tmp 0
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
scoreboard players operation $game.round scarena.tmp = @s scarena.game.round
execute as @a[predicate=scarena:match_game_id] run function scarena:game/as_marker/round/as_player
