#> as marker, at arena center


execute positioned ~ ~-32 ~ as @e[type=!minecraft:player,distance=..200] at @s run function scarena:arena/remove_entity
fill ~13 -14 ~13 ~-13 -6 ~-13 minecraft:barrier replace

scoreboard players set $game.player.slot scarena.tmp 0
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
execute as @a[predicate=scarena:match_game_id] run function scarena:game/as_marker/pre_round/as_player
