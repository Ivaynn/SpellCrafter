#> advancement reward
advancement revoke @s only spellcrafter:events/eat_cookie

scoreboard players add @s spellcrafter.max_mana 500
scoreboard players add @s spellcrafter.mana_reg 1

execute if score @s spellcrafter.max_mana matches 10000.. run scoreboard players set @s spellcrafter.max_mana 10000
execute if score @s spellcrafter.mana_reg matches 100.. run scoreboard players set @s spellcrafter.mana_reg 100
