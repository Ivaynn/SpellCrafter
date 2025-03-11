#> [tick] as non-player caster, at @s


# Use wand
scoreboard players set $has_target spellcrafter.tmp 0
execute on target run scoreboard players set $has_target spellcrafter.tmp 1

execute if score $has_target spellcrafter.tmp matches 1 unless score @s spellcrafter.cooldown matches 1.. if predicate spellcrafter:holding_wand run function spellcrafter:as_caster/nonplayer/use_wand
execute if score $has_target spellcrafter.tmp matches 0 as @s[type=minecraft:armor_stand] unless score @s spellcrafter.cooldown matches 1.. if predicate spellcrafter:holding_wand run function spellcrafter:as_caster/nonplayer/use_wand
execute if score @s spellcrafter.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cooldown 1


# Mana regen
execute unless score @s spellcrafter.mana matches 0.. run scoreboard players set @s spellcrafter.mana 0
execute unless score @s spellcrafter.max_mana matches 0.. run scoreboard players set @s spellcrafter.max_mana 0
execute unless score @s spellcrafter.mana_reg matches 0.. run scoreboard players set @s spellcrafter.mana_reg 0

scoreboard players operation @s spellcrafter.mana += @s spellcrafter.mana_reg
scoreboard players operation @s spellcrafter.mana < @s spellcrafter.max_mana
