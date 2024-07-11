#> as player


# Reset
execute unless items entity @s inventory.13 #isc:wand run function isc:as_player/inf_spells/custom_wand/reset


# Get current wand stats
data remove storage isc:tmp wand
data modify storage isc:tmp wand set from entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".isc.wand

scoreboard players set $mana isc.tmp 0
scoreboard players set $cooldown isc.tmp 0
scoreboard players set $spell_cap isc.tmp 0
scoreboard players set $spell_count isc.tmp 0

execute store result score $mana isc.tmp run data get storage isc:tmp wand.base_mana
execute store result score $cooldown isc.tmp run data get storage isc:tmp wand.base_cooldown
execute store result score $spell_cap isc.tmp run data get storage isc:tmp wand.cap


# Wand modifier id from the spell item slot
data modify storage isc:tmp wand.mod set value 0
scoreboard players set $wand_mod isc.tmp 0
execute store result score $wand_mod isc.tmp run data get entity @s Inventory[{Slot:31b}].components."minecraft:custom_data".isc.spell.id

scoreboard players set $allowed_mod isc.tmp 0
execute store result score $allowed_mod isc.tmp run function isc:as_projectile/wand_mods
execute if score $allowed_mod isc.tmp matches 1 store result storage isc:tmp wand.mod int 1 run scoreboard players get $wand_mod isc.tmp
execute if score $allowed_mod isc.tmp matches 0 run item replace entity @s inventory.22 with minecraft:red_stained_glass_pane[minecraft:item_name='{"text":"Wand Modifier"}',minecraft:custom_data={isc:{gui:11}}]
execute if score $allowed_mod isc.tmp matches 0 run scoreboard players set $wand_mod isc.tmp 0



# Buttons
execute unless data entity @s Inventory[{Slot:12b,id:"minecraft:paper",components:{"minecraft:custom_data":{isc:{gui:4}}}}] run scoreboard players remove $spell_cap isc.tmp 1
execute unless data entity @s Inventory[{Slot:14b,id:"minecraft:paper",components:{"minecraft:custom_data":{isc:{gui:5}}}}] run scoreboard players add $spell_cap isc.tmp 1

execute unless data entity @s Inventory[{Slot:21b,id:"minecraft:paper",components:{"minecraft:custom_data":{isc:{gui:6}}}}] run scoreboard players remove $mana isc.tmp 5
execute unless data entity @s Inventory[{Slot:23b,id:"minecraft:paper",components:{"minecraft:custom_data":{isc:{gui:7}}}}] run scoreboard players add $mana isc.tmp 5

execute unless data entity @s Inventory[{Slot:30b,id:"minecraft:paper",components:{"minecraft:custom_data":{isc:{gui:8}}}}] run scoreboard players remove $cooldown isc.tmp 5
execute unless data entity @s Inventory[{Slot:32b,id:"minecraft:paper",components:{"minecraft:custom_data":{isc:{gui:9}}}}] run scoreboard players add $cooldown isc.tmp 5


# Check limits
execute unless score $spell_cap isc.tmp matches 0.. run scoreboard players set $spell_cap isc.tmp 0
execute unless score $spell_cap isc.tmp matches ..27 run scoreboard players set $spell_cap isc.tmp 27
execute unless score $mana isc.tmp matches 0.. run scoreboard players set $mana isc.tmp 0
execute unless score $cooldown isc.tmp matches 0.. run scoreboard players set $cooldown isc.tmp 0


# Save stats
execute store result storage isc:tmp wand.cap int 1 run scoreboard players get $spell_cap isc.tmp

execute store result storage isc:tmp wand.mana int 1 run scoreboard players get $mana isc.tmp
execute store result storage isc:tmp wand.base_mana int 1 run scoreboard players get $mana isc.tmp

execute store result storage isc:tmp wand.cooldown int 1 run scoreboard players get $cooldown isc.tmp
execute store result storage isc:tmp wand.base_cooldown int 1 run scoreboard players get $cooldown isc.tmp


# Create storage with the cooldown in seconds format for the lore
function isc:as_table/close/cooldown_sec


# Modify wand item
item modify entity @s inventory.13 isc:wand/update
item modify entity @s inventory.13 isc:wand/empty
item modify entity @s inventory.13 isc:wand/lore/empty
