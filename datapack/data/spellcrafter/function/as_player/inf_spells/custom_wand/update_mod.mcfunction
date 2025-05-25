#> as player

# score "$inf_change_mod spellcrafter.tmp":
# 0 : 0->0 : no change 
# 1 : 1->1 : replaced the modifier with another
# 2 : 1->0 : removed the modifier
# 3 : 0->1 : added a modifier


# Get id of spell in modifier inventory slot
data modify storage spellcrafter:tmp wand.mod set value 0
scoreboard players set $wand_mod spellcrafter.tmp 0
execute store result score $wand_mod spellcrafter.tmp run data get storage spellcrafter:tmp inf_save.new.mod


# Validate mod
scoreboard players set $allowed_mod spellcrafter.tmp 0
execute store result score $allowed_mod spellcrafter.tmp run function spellcrafter:as_projectile/wand_mods
execute if score $allowed_mod spellcrafter.tmp matches 1 store result storage spellcrafter:tmp wand.mod int 1 run scoreboard players get $wand_mod spellcrafter.tmp
execute if score $allowed_mod spellcrafter.tmp matches 0 run function spellcrafter:as_player/inf_spells/custom_wand/clear_mod


# Update wand lore
execute if score $inf_change_mod spellcrafter.tmp matches 1 run item modify entity @s inventory.13 spellcrafter:wand/lore/wand_mod_replace
execute if score $inf_change_mod spellcrafter.tmp matches 2 run item modify entity @s inventory.13 spellcrafter:wand/lore/wand_mod_remove
execute if score $inf_change_mod spellcrafter.tmp matches 3 run item modify entity @s inventory.13 spellcrafter:wand/lore/wand_mod_add
