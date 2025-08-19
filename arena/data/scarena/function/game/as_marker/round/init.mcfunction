#> as marker, at arena center

execute positioned ~ ~-32 ~ as @e[type=!minecraft:player,distance=..200] at @s run function scarena:arena/remove_entity
fill ~13 -14 ~13 ~-13 -6 ~-13 minecraft:air replace

scoreboard players set $game.player.slot scarena.tmp 0
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
spreadplayers ~ ~ 1 100 under -20 false @a[predicate=scarena:match_game_id]
