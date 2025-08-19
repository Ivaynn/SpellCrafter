#> any

scoreboard players add $new scarena.game.id 1

execute positioned 0 0 0 summon minecraft:marker run function scarena:game/new/as_marker
execute unless score $game.slot scarena.tmp matches 1.. run return run function scarena:game/new/fail

execute as @a[scores={scarena.game.id=-1}] at @s run function scarena:game/new/as_player


# Find available arena
function scarena:game/instance_count
