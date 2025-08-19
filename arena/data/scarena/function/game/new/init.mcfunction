#> any

scoreboard players add $new scarena.player.game_id 1
execute as @a[scores={scarena.player.game_id=-1}] at @s run function scarena:game/new/as_player

execute positioned 0 0 0 summon minecraft:marker run function scarena:game/new/as_marker
