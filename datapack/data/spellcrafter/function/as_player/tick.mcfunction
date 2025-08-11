#> [tick] as player, at @s


# Infinite spells mode
execute if score @s spellcrafter.inf_page matches 100.. run function spellcrafter:as_player/inf_spells/init
execute as @s[tag=spellcrafter.inf_mana] run scoreboard players operation @s spellcrafter.mana = @s spellcrafter.max_mana


# Stop projectiles from hitting spectators
tag @a[gamemode=spectator] add spellcrafter.spectator
tag @a[gamemode=!spectator] remove spellcrafter.spectator


# All players must have an id
execute unless score @s spellcrafter.id matches 1.. run function spellcrafter:as_caster/new_id


# Trigger
execute unless score @s SpellCrafter matches 0 run function spellcrafter:as_player/trigger/init
scoreboard players set @s SpellCrafter 0
scoreboard players enable @s SpellCrafter


# Caster
execute as @s[tag=spellcrafter.caster,gamemode=!spectator] run function spellcrafter:as_caster/player/tick


# Trader
execute if score trader_spawn spellcrafter.options matches 1..3 run function spellcrafter:as_player/spawn_trader/tick
