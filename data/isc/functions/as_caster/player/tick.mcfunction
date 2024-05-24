#> [tick] as player, at @s


# Cooldown
execute unless score @s isc.cooldown matches 1.. run scoreboard players set @s isc.cooldown 0
execute if score @s isc.cooldown matches 1.. run scoreboard players remove @s isc.cooldown 1


# Mana regen
execute unless score @s isc.mana matches 0.. run scoreboard players set @s isc.mana 0
execute unless score @s isc.max_mana matches 1.. run scoreboard players set @s isc.max_mana 100
execute unless score @s isc.mana_reg matches 1.. run scoreboard players set @s isc.mana_reg 1

scoreboard players operation @s isc.mana += @s isc.mana_reg
scoreboard players operation @s isc.mana < @s isc.max_mana



# Action bar
function isc:as_caster/player/actionbar/tick
