#> as player, at arena center

scoreboard players add $game.player.slot scarena.tmp 1

execute if score $game.player.slot scarena.tmp matches 1 positioned ~8 -14 ~ run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 2 positioned ~-8 -14 ~ run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 3 positioned ~ -14 ~8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 4 positioned ~ -14 ~-8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 5 positioned ~8 -14 ~8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 6 positioned ~-8 -14 ~-8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 7 positioned ~8 -14 ~-8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 8 positioned ~-8 -14 ~8 run function scarena:game/as_marker/pre_round/build_cell
execute if score $game.player.slot scarena.tmp matches 9 positioned ~ -14 ~ run function scarena:game/as_marker/pre_round/build_cell

execute if score $game.player.slot scarena.tmp matches 10.. run function scarena:game/as_player/exit
