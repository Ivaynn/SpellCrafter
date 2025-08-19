#> as player, at @s
# Recursive function (limited by score "$game.slot scarena.tmp")


# Get unused slot ID
scoreboard players set $game.slot.new scarena.tmp 1
execute as @e[type=minecraft:marker,tag=scarena.game] if score @s scarena.game.slot = $game.slot scarena.tmp run scoreboard players set $game.slot.new scarena.tmp 0
execute if score $game.slot.new scarena.tmp matches 1 run return run scoreboard players operation @s scarena.game.slot = $game.slot scarena.tmp


# Next iteration
scoreboard players add $game.slot scarena.tmp 1
execute unless score $game.slot scarena.tmp > game.max_instances scarena.main run function scarena:game/new/for_slot
