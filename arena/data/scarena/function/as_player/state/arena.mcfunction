#> [tick] as player, at @s
# Executed if player is at arena (state 3)


# Reset mana scores on tick to prevent use of Mana Cookie
scoreboard players set @s spellcrafter.max_mana 10000
scoreboard players set @s spellcrafter.mana_reg 25


# Void death
execute at @s unless entity @s[y=-61,dy=45] run damage @s 1000000 minecraft:out_of_world


# Triggers
scoreboard players enable @s spawn
scoreboard players enable @s queue
scoreboard players enable @s room

execute if score @s spawn matches 1.. run function scarena:as_player/state/join/lobby
scoreboard players set @s spawn 0

execute if score @s room matches 1.. run function scarena:as_player/state/join/room
scoreboard players set @s room 0

execute if score @s queue matches 1.. run function scarena:as_player/queue/trigger
scoreboard players set @s queue 0
