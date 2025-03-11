#> as player


# Reset
execute unless items entity @s inventory.13 #spellcrafter:wand run function spellcrafter:as_player/inf_spells/custom_wand/reset


# Get current wand stats
data remove storage spellcrafter:tmp wand
data modify storage spellcrafter:tmp wand set from entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand

scoreboard players set $mana spellcrafter.tmp 0
scoreboard players set $cooldown spellcrafter.tmp 0
scoreboard players set $spell_cap spellcrafter.tmp 0
scoreboard players set $spell_count spellcrafter.tmp 0

execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_mana
execute store result score $cooldown spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_cooldown
execute store result score $spell_cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap


# Wand modifier id from the spell item slot
data modify storage spellcrafter:tmp wand.mod set value 0
scoreboard players set $wand_mod spellcrafter.tmp 0
execute store result score $wand_mod spellcrafter.tmp run data get entity @s Inventory[{Slot:31b}].components."minecraft:custom_data".spellcrafter.spell.id

scoreboard players set $allowed_mod spellcrafter.tmp 0
execute store result score $allowed_mod spellcrafter.tmp run function spellcrafter:as_projectile/wand_mods
execute if score $allowed_mod spellcrafter.tmp matches 1 store result storage spellcrafter:tmp wand.mod int 1 run scoreboard players get $wand_mod spellcrafter.tmp
execute if score $allowed_mod spellcrafter.tmp matches 0 run item replace entity @s inventory.22 with minecraft:red_stained_glass_pane[minecraft:item_name='{"text":"Wand Modifier"}',minecraft:custom_data={spellcrafter:{gui:11}}]
execute if score $allowed_mod spellcrafter.tmp matches 0 run scoreboard players set $wand_mod spellcrafter.tmp 0



# Buttons
execute unless data entity @s Inventory[{Slot:12b,id:"minecraft:paper",components:{"minecraft:custom_data":{spellcrafter:{gui:4}}}}] run scoreboard players remove $spell_cap spellcrafter.tmp 1
execute unless data entity @s Inventory[{Slot:14b,id:"minecraft:paper",components:{"minecraft:custom_data":{spellcrafter:{gui:5}}}}] run scoreboard players add $spell_cap spellcrafter.tmp 1

execute unless data entity @s Inventory[{Slot:21b,id:"minecraft:paper",components:{"minecraft:custom_data":{spellcrafter:{gui:6}}}}] run scoreboard players remove $mana spellcrafter.tmp 5
execute unless data entity @s Inventory[{Slot:23b,id:"minecraft:paper",components:{"minecraft:custom_data":{spellcrafter:{gui:7}}}}] run scoreboard players add $mana spellcrafter.tmp 5

execute unless data entity @s Inventory[{Slot:30b,id:"minecraft:paper",components:{"minecraft:custom_data":{spellcrafter:{gui:8}}}}] run scoreboard players remove $cooldown spellcrafter.tmp 5
execute unless data entity @s Inventory[{Slot:32b,id:"minecraft:paper",components:{"minecraft:custom_data":{spellcrafter:{gui:9}}}}] run scoreboard players add $cooldown spellcrafter.tmp 5


# Check limits
execute unless score $spell_cap spellcrafter.tmp matches 0.. run scoreboard players set $spell_cap spellcrafter.tmp 0
execute unless score $spell_cap spellcrafter.tmp matches ..27 run scoreboard players set $spell_cap spellcrafter.tmp 27
execute unless score $mana spellcrafter.tmp matches 0.. run scoreboard players set $mana spellcrafter.tmp 0
execute unless score $cooldown spellcrafter.tmp matches 0.. run scoreboard players set $cooldown spellcrafter.tmp 0


# Save stats
execute store result storage spellcrafter:tmp wand.cap int 1 run scoreboard players get $spell_cap spellcrafter.tmp

execute store result storage spellcrafter:tmp wand.mana int 1 run scoreboard players get $mana spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.base_mana int 1 run scoreboard players get $mana spellcrafter.tmp

execute store result storage spellcrafter:tmp wand.cooldown int 1 run scoreboard players get $cooldown spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.base_cooldown int 1 run scoreboard players get $cooldown spellcrafter.tmp


# Create storage with the cooldown in seconds format for the lore
function spellcrafter:as_table/close/cooldown_sec


# Modify wand item
item modify entity @s inventory.13 spellcrafter:wand/update
item modify entity @s inventory.13 spellcrafter:wand/empty
item modify entity @s inventory.13 spellcrafter:wand/lore/empty
