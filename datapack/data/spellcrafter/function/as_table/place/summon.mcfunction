#> execute summon (block_display)

tag @s add spellcrafter.table

data merge entity @s {transformation:{scale:[1.002f,1.002f,1.002f],translation:[-0.501f,-1.001f,-0.501f]},block_state:{Name:"minecraft:structure_block",Properties:{mode:"save"}}}

execute positioned ~ ~-1 ~ run function spellcrafter:as_table/place/setblock
