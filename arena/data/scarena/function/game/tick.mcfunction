#> [tick]


execute if score queue.timer scarena.main matches 1.. run function scarena:game/new/countdown/tick
execute as @e[type=minecraft:marker,tag=scarena.game] run function scarena:game/as_marker/tick
