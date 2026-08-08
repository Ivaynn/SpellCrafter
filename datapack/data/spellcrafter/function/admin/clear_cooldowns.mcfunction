
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.cache.cooldown 0

execute if items entity @s weapon.offhand #spellcrafter:wand if data entity @s equipment.offhand.components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s weapon.offhand spellcrafter:wand/clear_cooldown

execute if items entity @s hotbar.0 #spellcrafter:wand if data entity @s Inventory[{Slot:0b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.0 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.1 #spellcrafter:wand if data entity @s Inventory[{Slot:1b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.1 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.2 #spellcrafter:wand if data entity @s Inventory[{Slot:2b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.2 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.3 #spellcrafter:wand if data entity @s Inventory[{Slot:3b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.3 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.4 #spellcrafter:wand if data entity @s Inventory[{Slot:4b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.4 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.5 #spellcrafter:wand if data entity @s Inventory[{Slot:5b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.5 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.6 #spellcrafter:wand if data entity @s Inventory[{Slot:6b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.6 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.7 #spellcrafter:wand if data entity @s Inventory[{Slot:7b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.7 spellcrafter:wand/clear_cooldown
execute if items entity @s hotbar.8 #spellcrafter:wand if data entity @s Inventory[{Slot:8b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s hotbar.8 spellcrafter:wand/clear_cooldown

execute if items entity @s inventory.0 #spellcrafter:wand if data entity @s Inventory[{Slot:9b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.0 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.1 #spellcrafter:wand if data entity @s Inventory[{Slot:10b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.1 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.2 #spellcrafter:wand if data entity @s Inventory[{Slot:11b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.2 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.3 #spellcrafter:wand if data entity @s Inventory[{Slot:12b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.3 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.4 #spellcrafter:wand if data entity @s Inventory[{Slot:13b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.4 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.5 #spellcrafter:wand if data entity @s Inventory[{Slot:14b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.5 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.6 #spellcrafter:wand if data entity @s Inventory[{Slot:15b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.6 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.7 #spellcrafter:wand if data entity @s Inventory[{Slot:16b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.7 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.8 #spellcrafter:wand if data entity @s Inventory[{Slot:17b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.8 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.9 #spellcrafter:wand if data entity @s Inventory[{Slot:18b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.9 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.10 #spellcrafter:wand if data entity @s Inventory[{Slot:19b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.10 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.11 #spellcrafter:wand if data entity @s Inventory[{Slot:20b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.11 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.12 #spellcrafter:wand if data entity @s Inventory[{Slot:21b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.12 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.13 #spellcrafter:wand if data entity @s Inventory[{Slot:22b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.13 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.14 #spellcrafter:wand if data entity @s Inventory[{Slot:23b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.14 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.15 #spellcrafter:wand if data entity @s Inventory[{Slot:24b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.15 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.16 #spellcrafter:wand if data entity @s Inventory[{Slot:25b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.16 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.17 #spellcrafter:wand if data entity @s Inventory[{Slot:26b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.17 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.18 #spellcrafter:wand if data entity @s Inventory[{Slot:27b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.18 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.19 #spellcrafter:wand if data entity @s Inventory[{Slot:28b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.19 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.20 #spellcrafter:wand if data entity @s Inventory[{Slot:29b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.20 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.21 #spellcrafter:wand if data entity @s Inventory[{Slot:30b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.21 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.22 #spellcrafter:wand if data entity @s Inventory[{Slot:31b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.22 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.23 #spellcrafter:wand if data entity @s Inventory[{Slot:32b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.23 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.24 #spellcrafter:wand if data entity @s Inventory[{Slot:33b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.24 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.25 #spellcrafter:wand if data entity @s Inventory[{Slot:34b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.25 spellcrafter:wand/clear_cooldown
execute if items entity @s inventory.26 #spellcrafter:wand if data entity @s Inventory[{Slot:35b}].components."minecraft:custom_data".spellcrafter.wand.valid run item modify entity @s inventory.26 spellcrafter:wand/clear_cooldown
