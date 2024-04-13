#> [tick] as player, at @s


# Use wand
execute if score @s isc.right_click matches 1.. run function isc:as_caster/use_wand
scoreboard players set @s isc.right_click 0


# Mana regen
execute unless score @s isc.mana matches 0.. run scoreboard players set @s isc.mana 0
execute unless score @s isc.max_mana matches 0.. run scoreboard players set @s isc.max_mana 1000
execute if score @s isc.mana < @s isc.max_mana run scoreboard players add @s isc.mana 1
title @s actionbar ["",{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"},{"text":"/","color":"aqua"},{"score":{"name":"@s","objective":"isc.max_mana"},"color":"aqua"}]

