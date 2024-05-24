#> [tick] as player, at @s


# Cooldown
execute unless score @s isc.cooldown matches 1.. run scoreboard players set @s isc.cooldown 0
execute if score @s isc.cooldown matches 1.. run scoreboard players remove @s isc.cooldown 1


# Mana regen
execute unless score @s isc.mana matches 0.. run scoreboard players set @s isc.mana 0
execute unless score @s isc.max_mana matches 0.. run scoreboard players set @s isc.max_mana 1000
execute if score @s isc.mana < @s isc.max_mana run scoreboard players add @s isc.mana 1



# Action bar
function isc:as_caster/player/actionbar/tick
