#> [tick] as non-player caster, at @s


# Use wand
scoreboard players set $has_target isc.tmp 0
execute on target run scoreboard players set $has_target isc.tmp 1

execute if score $has_target isc.tmp matches 1 unless score @s isc.cooldown matches 1.. if predicate isc:holding_wand run function isc:as_caster/nonplayer/use_wand
execute if score $has_target isc.tmp matches 0 as @s[type=minecraft:armor_stand] unless score @s isc.cooldown matches 1.. if predicate isc:holding_wand run function isc:as_caster/nonplayer/use_wand
execute if score @s isc.cooldown matches 1.. run scoreboard players remove @s isc.cooldown 1


# Mana regen
execute unless score @s isc.mana matches 0.. run scoreboard players set @s isc.mana 0
execute unless score @s isc.max_mana matches 0.. run scoreboard players set @s isc.max_mana 1000
execute if score @s isc.mana < @s isc.max_mana run scoreboard players add @s isc.mana 1

