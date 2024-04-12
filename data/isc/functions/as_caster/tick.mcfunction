# Executed by every non-player caster, every tick


# Use wand
execute unless score @s isc.cooldown matches 1.. run function isc:as_caster/use_wand
scoreboard players remove @s isc.cooldown 1


# Mana
execute if score @s isc.mana < @s isc.max_mana run scoreboard players add @s isc.mana 1
