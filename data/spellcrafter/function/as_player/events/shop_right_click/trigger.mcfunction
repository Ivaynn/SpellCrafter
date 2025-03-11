#> Advancement reward
advancement revoke @s only spellcrafter:events/shop_right_click

scoreboard players set $shop.result spellcrafter.tmp 0

tag @s add spellcrafter.shop.tmp
execute as @e[distance=..10,sort=nearest,type=minecraft:interaction,tag=spellcrafter.shop.interaction] run function spellcrafter:as_player/events/shop_right_click/as_shop
tag @s remove spellcrafter.shop.tmp

execute if score $shop.result spellcrafter.tmp matches 1 run tellraw @s ["",{"text":"> ","color":"red","bold":true},{"text":"You don't have enough XP!","color":"gray"}]
execute if score $shop.result spellcrafter.tmp matches 2 run tellraw @s ["",{"text":"> ","color":"red","bold":true},{"text":"You can't use this shop!","color":"gray"}]
execute if score $shop.result spellcrafter.tmp matches 3 run tellraw @s ["",{"text":"> ","color":"dark_aqua","bold":true},{"text":"You bought ","color":"gray"},{"nbt":"item.components.\"minecraft:item_name\"","storage":"spellcrafter:tmp","interpret":true,"color":"light_purple"}]
