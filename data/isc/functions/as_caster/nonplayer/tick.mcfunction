#> [tick] as non-player caster, at @s


# Use wand
execute unless score @s isc.cooldown matches 1.. run function isc:as_caster/nonplayer/use_wand
scoreboard players remove @s isc.cooldown 1


# Mana regen
execute unless score @s isc.mana matches 0.. run scoreboard players set @s isc.mana 0
execute unless score @s isc.max_mana matches 0.. run scoreboard players set @s isc.max_mana 1000
execute if score @s isc.mana < @s isc.max_mana run scoreboard players add @s isc.mana 1

