#> as wandering trader, at @s

execute summon minecraft:item_display run function spellcrafter:wand_generator/as_item
item replace entity @s weapon.mainhand from entity @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen] contents
kill @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen]
