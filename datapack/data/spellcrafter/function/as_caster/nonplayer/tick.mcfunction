#> [tick] as non-player caster, at @s


# Initialize missing data
execute as @s[tag=!spellcrafter.target_dummy] unless score @s spellcrafter.mana matches 0.. run function spellcrafter:as_caster/nonplayer/get_mana
execute as @s[tag=!spellcrafter.target_dummy] unless predicate spellcrafter:holding_wand run function spellcrafter:as_caster/nonplayer/get_wand
execute as @s[tag=!spellcrafter.caster] run return 0


# Use wand
scoreboard players set $has_target spellcrafter.tmp 0
execute on target run scoreboard players set $has_target spellcrafter.tmp 1

execute if score $has_target spellcrafter.tmp matches 1 unless score @s spellcrafter.cooldown matches 1.. if predicate spellcrafter:holding_wand run function spellcrafter:as_caster/use_wand
execute if score $has_target spellcrafter.tmp matches 0 as @s[tag=spellcrafter.target_dummy] unless score @s spellcrafter.cooldown matches 1.. if predicate spellcrafter:holding_wand run function spellcrafter:as_caster/use_wand
execute if score @s spellcrafter.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cooldown 1


# Mana
scoreboard players set $mana_drain spellcrafter.tmp 0
execute if predicate spellcrafter:holding_wand store result score $mana_drain spellcrafter.tmp run data get entity @s equipment.mainhand.components."minecraft:custom_data".spellcrafter.wand.drain
scoreboard players operation @s spellcrafter.mana -= $mana_drain spellcrafter.tmp

scoreboard players operation @s spellcrafter.mana += @s spellcrafter.mana_reg
scoreboard players operation @s spellcrafter.mana < @s spellcrafter.max_mana

execute unless score @s spellcrafter.mana matches 0.. run scoreboard players set @s spellcrafter.mana 0
execute unless score @s spellcrafter.max_mana matches 1.. run scoreboard players set @s spellcrafter.max_mana 0
execute unless score @s spellcrafter.mana_reg matches 1.. run scoreboard players set @s spellcrafter.mana_reg 0
