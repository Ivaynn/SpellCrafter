#> [tick] as player, at @s


# Default cooldown
execute unless score @s spellcrafter.trader_timer matches 1.. run scoreboard players set @s spellcrafter.trader_timer 48000


# Timer
execute if score trader_spawn spellcrafter.options matches 1 run scoreboard players remove @s spellcrafter.trader_timer 1
execute if score trader_spawn spellcrafter.options matches 2 run scoreboard players remove @s spellcrafter.trader_timer 2
execute if score trader_spawn spellcrafter.options matches 3 run scoreboard players remove @s spellcrafter.trader_timer 4
execute if score @s spellcrafter.trader_timer matches 1.. run return 0


# Spawn attempt
execute store result score $random spellcrafter.tmp run random value 1..4


# (75%) fail -> reset to a shorter cooldown
execute if score $random spellcrafter.tmp matches 1 run return run scoreboard players set @s spellcrafter.trader_timer 10000
execute if score $random spellcrafter.tmp matches 2 run return run scoreboard players set @s spellcrafter.trader_timer 12000
execute if score $random spellcrafter.tmp matches 3 run return run scoreboard players set @s spellcrafter.trader_timer 14000


# (25%) success -> spawn trader + reset to long cooldown
scoreboard players set $success spellcrafter.tmp 0
execute summon minecraft:marker run function spellcrafter:as_player/spawn_trader/as_marker
execute if score $success spellcrafter.tmp matches 1 run scoreboard players set @s spellcrafter.trader_timer 48000
execute if score $success spellcrafter.tmp matches 0 run scoreboard players set @s spellcrafter.trader_timer 12000
