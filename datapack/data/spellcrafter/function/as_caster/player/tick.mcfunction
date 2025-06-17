#> [tick] as player, at @s


# Hats
execute if score @s spellcrafter.hat matches 3 run function spellcrafter:as_caster/player/hat/mana
execute if score @s spellcrafter.hat matches 7 run function spellcrafter:as_caster/player/hat/heal
execute if score @s spellcrafter.hat matches 8 run function spellcrafter:as_caster/player/hat/stealth


# Cooldown
execute unless score @s spellcrafter.cooldown matches 1.. run scoreboard players set @s spellcrafter.cooldown 0
execute if score @s spellcrafter.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cooldown 1


# Mana
scoreboard players set $mana_drain spellcrafter.tmp 0
execute if predicate spellcrafter:holding_wand store result score $mana_drain spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.drain
scoreboard players operation @s spellcrafter.mana -= $mana_drain spellcrafter.tmp

scoreboard players operation @s spellcrafter.mana += @s spellcrafter.mana_reg
scoreboard players operation @s spellcrafter.mana < @s spellcrafter.max_mana

execute unless score @s spellcrafter.mana matches 0.. run scoreboard players set @s spellcrafter.mana 0
execute unless score @s spellcrafter.max_mana matches 1.. run scoreboard players set @s spellcrafter.max_mana 1000
execute unless score @s spellcrafter.mana_reg matches 1.. run scoreboard players set @s spellcrafter.mana_reg 10


# Action bar
function spellcrafter:as_caster/player/actionbar/tick
