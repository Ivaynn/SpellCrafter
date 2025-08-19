#> any

scoreboard players add $new scarena.game.id 1
execute as @a[scores={scarena.game.id=-1}] at @s run function scarena:game/new/as_player

execute positioned 0 0 0 summon minecraft:marker run function scarena:game/new/as_marker


# Find available arena
function scarena:game/instance_count

