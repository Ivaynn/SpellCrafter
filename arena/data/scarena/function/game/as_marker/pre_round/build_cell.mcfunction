#> as player, at cell center

fill ~2 ~ ~2 ~-2 ~ ~-2 minecraft:black_stained_glass
fill ~2 ~1 ~2 ~-2 ~5 ~-2 minecraft:air

execute positioned ~2 ~1 ~-2 run function spellcrafter:as_table/place/init

setblock ~2 ~1 ~2 minecraft:anvil

execute positioned ~-2 ~1 ~-2 summon minecraft:wandering_trader run function scarena:game/as_marker/pre_round/as_trader

setblock ~-2 ~1 ~2 minecraft:oak_sign[rotation=10,waterlogged=false]{back_text:{color:"black",has_glowing_text:0b,messages:["","","",""]},components:{},front_text:{color:"black",has_glowing_text:0b,messages:["",{bold:1b,color:"dark_green",text:"Ready"},"",{click_event:{action:"run_command",command:"/trigger ready"},color:"#2B2B2B",text:"/trigger ready"}]},is_waxed:0b}

tp @s ~ ~1 ~ 180 0
