#> as player
function spellcrafter:as_player/inf_spells/custom_wand/clear_skin
execute unless items entity @s inventory.13 #spellcrafter:wand run return 0


# Get wand and mod
data modify storage spellcrafter:tmp inf_save set value {new: {}, old: {}}
data modify storage spellcrafter:tmp inf_save.new.wand set from entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand
data modify storage spellcrafter:tmp inf_save.new.mod set from entity @s Inventory[{Slot:31b}].components."minecraft:custom_data".spellcrafter.spell.id


# Increment skin
scoreboard players set $skin_id spellcrafter.tmp 0
execute store result score $skin_id spellcrafter.tmp run data get storage spellcrafter:tmp inf_save.new.wand.skin
scoreboard players add $skin_id spellcrafter.tmp 1
execute unless score $skin_id spellcrafter.tmp matches 0..8 run scoreboard players set $skin_id spellcrafter.tmp 0
execute store result storage spellcrafter:tmp inf_save.new.wand.skin int 1 run scoreboard players get $skin_id spellcrafter.tmp


# Apply skin
data modify storage spellcrafter:tmp wand set from storage spellcrafter:tmp inf_save.new.wand
item modify entity @s inventory.13 spellcrafter:wand/set_skin


# Save data to use as "old" in the next update
item modify entity @s inventory.4 spellcrafter:wand/inf_save
