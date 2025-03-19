#> as player
function spellcrafter:as_player/inf_spells/custom_wand/clear_skin
execute unless items entity @s inventory.13 #spellcrafter:wand run return 0


# Save the current wand and mod as "old" for next update
data modify storage spellcrafter:tmp inf_save set value {new: {}, old: {}}
data modify storage spellcrafter:tmp inf_save.new.wand set from entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand
data modify storage spellcrafter:tmp inf_save.new.mod set from entity @s Inventory[{Slot:31b}].components."minecraft:custom_data".spellcrafter.spell.id
item modify entity @s inventory.4 spellcrafter:wand/inf_save


say change skin
