#> as player

execute store result score $gen.tier spellcrafter.tmp run random value 1..5
execute summon minecraft:item_display run function spellcrafter:wand_generator/as_item
item replace entity @s inventory.18 from entity @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen] contents
kill @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen]
