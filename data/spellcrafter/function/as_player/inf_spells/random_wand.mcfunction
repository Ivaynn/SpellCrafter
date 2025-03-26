#> as player

scoreboard players set $gen.inf_menu spellcrafter.tmp 1
execute store result score $gen.tier spellcrafter.tmp run random value 1..5
# scoreboard players set $gen.tier spellcrafter.tmp 5
execute summon minecraft:item_display run function spellcrafter:wand_generator/as_item
