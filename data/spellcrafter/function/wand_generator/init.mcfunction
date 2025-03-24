#> any

execute store result score $gen.tier spellcrafter.tmp run random value 1..5
execute summon minecraft:item_display run function spellcrafter:wand_generator/as_item
# storage "spellcrafter:tmp gen" contains the item data

summon item ~ ~ ~ {Item:{id:"stone"}}
data modify entity @e[limit=1,sort=nearest,distance=..0.001,type=item] Item set from storage spellcrafter:tmp gen
