#> as player

scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand.mod
execute if score $spell spellcrafter.tmp matches 1.. run function spellcrafter:as_player/inf_spells/custom_wand/loot_insert
