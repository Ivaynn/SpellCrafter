#> execute summon (item_display)

tag @s add spellcrafter.table

data merge entity @s {transformation:{scale:[1.002f,1.002f,1.002f],translation:[0f,-0.5f,0f]},item:{id:"minecraft:structure_block",count:1,components:{"minecraft:custom_model_data":{strings:["spellcrafter.block.wand_editor"]}}}}

execute positioned ~ ~-1 ~ run function spellcrafter:as_table/place/setblock
