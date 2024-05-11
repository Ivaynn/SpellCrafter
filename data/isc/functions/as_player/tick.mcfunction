#> [tick] as player, at @s


# All players must have a caster id
execute unless score @s isc.id matches 1.. run function isc:as_caster/new_id


# Cooldown
execute if score @s isc.cooldown matches 1.. run scoreboard players remove @s isc.cooldown 1


# Mana regen
execute unless score @s isc.mana matches 0.. run scoreboard players set @s isc.mana 0
execute unless score @s isc.max_mana matches 0.. run scoreboard players set @s isc.max_mana 1000
execute if score @s isc.mana < @s isc.max_mana run scoreboard players add @s isc.mana 1
title @s actionbar ["",{"text":"◆ ","color":"aqua"},{"score":{"name":"@s","objective":"isc.mana"},"color":"aqua"},{"text":"   ⌚ ","color":"gray"},{"score":{"name":"@s","objective":"isc.cooldown"},"color":"gray"}]

