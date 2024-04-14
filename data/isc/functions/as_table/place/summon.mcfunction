#> execute summon (block_display)

tag @s add isc.table

data merge entity @s {transformation:{scale:[1.0002f,1.0002f,1.0002f],translation:[-0.5001f,-1.0001f,-0.5001f]},block_state:{Name:"minecraft:structure_block",Properties:{mode:"save"}}}

execute positioned ~ ~-1 ~ run function isc:as_table/place/setblock
