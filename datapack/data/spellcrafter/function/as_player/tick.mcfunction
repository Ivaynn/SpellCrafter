#> [tick] as player, at @s


# Infinite spells mode
execute if score @s spellcrafter.inf_page matches 100.. run function spellcrafter:as_player/inf_spells/init
execute as @s[tag=spellcrafter.inf_mana] run scoreboard players operation @s spellcrafter.mana = @s spellcrafter.max_mana


# Stop projectiles from hitting spectators
tag @a[gamemode=spectator] add spellcrafter.spectator
tag @a[gamemode=!spectator] remove spellcrafter.spectator


# All players must have an id
execute unless score @s spellcrafter.id matches 1.. run function spellcrafter:as_caster/new_id


# Triggers
execute as @a unless score @s spellcrafter.toggle matches 0 run function spellcrafter:as_player/trigger_toggle
scoreboard players enable @a spellcrafter.toggle
scoreboard players enable @a spellcrafter.actionbar


# Caster
execute as @s[tag=spellcrafter.caster,gamemode=!spectator] run function spellcrafter:as_caster/player/tick


# Trader
execute if score trader_spawn spellcrafter.options matches 1..3 run function spellcrafter:as_player/spawn_trader/tick
