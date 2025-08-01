#> [tick] as player, at @s

scoreboard players set $holding_wand spellcrafter.tmp 0
execute if predicate spellcrafter:holding_wand run scoreboard players set $holding_wand spellcrafter.tmp 1


# Invalidate cache every X ticks
scoreboard players operation $rem spellcrafter.tmp = $gametime spellcrafter.tmp
scoreboard players operation $rem spellcrafter.tmp %= #100 spellcrafter.math
execute if score $rem spellcrafter.tmp matches 0 run scoreboard players set @s spellcrafter.cache.cooldown -1
execute if score $rem spellcrafter.tmp matches 0 run scoreboard players set @s spellcrafter.cache.drain -1


# Hats
execute if score @s spellcrafter.hat matches 3 run function spellcrafter:as_caster/player/hat/mana
execute if score @s spellcrafter.hat matches 7 run function spellcrafter:as_caster/player/hat/heal
execute if score @s spellcrafter.hat matches 8 run function spellcrafter:as_caster/player/hat/stealth


# Cooldown
execute unless score @s spellcrafter.cooldown matches 1.. run scoreboard players set @s spellcrafter.cooldown 0
execute if score @s spellcrafter.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cooldown 1
execute if score @s spellcrafter.cache.cooldown matches 1.. run scoreboard players remove @s spellcrafter.cache.cooldown 1


# Invalidate selected item cache if item slot changes
scoreboard players operation $cache.slot spellcrafter.tmp = @s spellcrafter.cache.slot
execute if score $holding_wand spellcrafter.tmp matches 1 store result score @s spellcrafter.cache.slot run data get entity @s SelectedItemSlot
execute unless score $cache.slot spellcrafter.tmp = @s spellcrafter.cache.slot run scoreboard players set @s spellcrafter.cache.cooldown -1
execute unless score $cache.slot spellcrafter.tmp = @s spellcrafter.cache.slot run scoreboard players set @s spellcrafter.cache.drain -1


# Mana
scoreboard players set $mana_drain spellcrafter.tmp 0
execute if score $holding_wand spellcrafter.tmp matches 1 run function spellcrafter:as_caster/player/get_drain
scoreboard players operation @s spellcrafter.mana -= $mana_drain spellcrafter.tmp

scoreboard players operation @s spellcrafter.mana += @s spellcrafter.mana_reg
scoreboard players operation @s spellcrafter.mana < @s spellcrafter.max_mana

execute unless score @s spellcrafter.mana matches 0.. run scoreboard players set @s spellcrafter.mana 0
execute unless score @s spellcrafter.max_mana matches 1.. run scoreboard players set @s spellcrafter.max_mana 1000
execute unless score @s spellcrafter.mana_reg matches 1.. run scoreboard players set @s spellcrafter.mana_reg 10


# Action bar
function spellcrafter:as_caster/player/actionbar/tick
