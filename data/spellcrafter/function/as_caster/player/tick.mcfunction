#> [tick] as player, at @s


# Cooldown
execute unless score @s spellcrafter.cooldown matches 1.. run scoreboard players set @s spellcrafter.cooldown 0
execute if score @s spellcrafter.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cooldown 1


# Mana regen
execute unless score @s spellcrafter.mana matches 0.. run scoreboard players set @s spellcrafter.mana 0
execute unless score @s spellcrafter.max_mana matches 1.. run scoreboard players set @s spellcrafter.max_mana 100
execute unless score @s spellcrafter.mana_reg matches 1.. run scoreboard players set @s spellcrafter.mana_reg 1

scoreboard players operation @s spellcrafter.mana += @s spellcrafter.mana_reg
scoreboard players operation @s spellcrafter.mana < @s spellcrafter.max_mana



# Action bar
function spellcrafter:as_caster/player/actionbar/tick
