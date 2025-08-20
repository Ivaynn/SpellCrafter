#> as player, at arena center

spawnpoint @s ~ -14 ~
scoreboard players add $game.player.slot scarena.tmp 1
gamemode adventure @s

tag @s add spellcrafter.untargetable
effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true
scoreboard players operation @s spellcrafter.cooldown = $game.timer scarena.tmp


# Get emeralds
scoreboard players operation $emeralds.bonus scarena.tmp = game.lives scarena.main
scoreboard players operation $emeralds.bonus scarena.tmp -= @s scarena.game.lives
scoreboard players operation $emeralds.bonus scarena.tmp *= #5 scarena.math

scoreboard players operation $emeralds scarena.tmp = $game.round scarena.tmp
scoreboard players operation $emeralds scarena.tmp *= #5 scarena.math
scoreboard players add $emeralds scarena.tmp 20
scoreboard players operation $emeralds scarena.tmp += $emeralds.bonus scarena.tmp
loot give @s loot scarena:emeralds


# Build cells
execute if score $game.player.slot scarena.tmp matches 1 positioned ~8 -10 ~ run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 2 positioned ~-8 -10 ~ run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 3 positioned ~ -10 ~8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 4 positioned ~ -10 ~-8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 5 positioned ~8 -10 ~8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 6 positioned ~-8 -10 ~-8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 7 positioned ~8 -10 ~-8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 8 positioned ~-8 -10 ~8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 9 positioned ~ -10 ~ run function scarena:game/as_marker/pre_round/build_cell


# Too many players!
execute if score $game.player.slot scarena.tmp matches 10.. run function scarena:game/as_player/exit
