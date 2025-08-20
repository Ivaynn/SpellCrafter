#> as player, at cell center

fill ~2 ~ ~2 ~-2 ~ ~-2 minecraft:black_stained_glass
fill ~2 ~1 ~2 ~-2 ~5 ~-2 minecraft:air

execute positioned ~2 ~1 ~2 run function spellcrafter:as_table/place/init

setblock ~2 ~1 ~-2 minecraft:anvil

execute positioned ~-2 ~1 ~-2 summon minecraft:wandering_trader run function scarena:game/as_marker/pre_round/as_trader

tp @s ~ ~1 ~
