#> [tick] as player, at @s


# Scoreboard events
execute unless score @s scarena.player.id matches 1.. run function scarena:as_player/events/first_join
execute if score @s scarena.player.relog matches 1.. run function scarena:as_player/events/relog
execute if score @s scarena.player.death matches 1.. run function scarena:as_player/events/respawn
scoreboard players set @s scarena.player.relog 0
scoreboard players set @s scarena.player.death 0


# Stats
scoreboard players operation @s[scores={scarena.player.state=3}] scarena.stats.arena.kills += @s scarena.player.kills
scoreboard players operation @s[scores={scarena.player.state=4}] scarena.stats.game.kills += @s scarena.player.kills
scoreboard players set @s scarena.player.kills 0

scoreboard players enable @s stats
execute if score @s stats matches 0.. run function scarena:as_player/stats/get/init
scoreboard players set @s stats -1


# Health display
execute store result score @s scarena.health run data get entity @s Health 0.5


# Handle dropped items
execute as @e[distance=..5,type=minecraft:item,tag=!scarena.item] at @s run function scarena:as_player/dropped_item/init


# Handle locked inventory
execute if score @s scarena.player.state matches 1..3 unless score @s spellcrafter.inf_page matches 1.. run function scarena:as_player/inventory_locked


# State 0 or undefined: new player -> default to 1
execute unless score @s scarena.player.state matches 1.. run function scarena:as_player/state/join/lobby


# State 1: at lobby
execute if score @s scarena.player.state matches 1 run function scarena:as_player/state/lobby


# State 2: at private room
execute if score @s scarena.player.state matches 2 run function scarena:as_player/state/room


# State 3: at FFA arena
execute if score @s scarena.player.state matches 3 run function scarena:as_player/state/arena


# State 4: at game arena
execute if score @s scarena.player.state matches 4 run function scarena:as_player/state/game


# Spectator out of bounds
execute as @s[gamemode=spectator] at @s unless entity @s[z=-800,dz=10000] run return run tp @s 0 0 0
execute as @s[gamemode=spectator] at @s unless entity @s[y=-200,dy=180] run return run tp @s ~ -20 ~
