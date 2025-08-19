#> executed by #minecraft:load
tellraw @a ["",{text:"> ",color:"#965ed6",bold:true},{text:"Reloaded!",color:"gray"}]


# Gamerules
gamerule commandModificationBlockLimit 500000
gamerule spawnRadius 0
gamerule doTileDrops false
gamerule naturalRegeneration false
gamerule keepInventory true
gamerule sendCommandFeedback true
gamerule doImmediateRespawn true
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doMobSpawning false
gamerule doMobLoot true
gamerule doFireTick true
gamerule announceAdvancements false


# World
time set 6000
setworldspawn 0 0 0
difficulty normal
weather clear
fill -2 -1 -2 2 3 2 minecraft:black_concrete hollow
function scarena:lobby/load


# Scoreboards
scoreboard objectives add scarena.main dummy
scoreboard objectives add scarena.tmp dummy
scoreboard objectives add scarena.player.relog minecraft.custom:leave_game
scoreboard objectives add scarena.player.death minecraft.custom:deaths
scoreboard objectives add scarena.player.state dummy
scoreboard objectives add scarena.player.game_id dummy
scoreboard objectives add scarena.player.room_id dummy

scoreboard objectives add spawn trigger
scoreboard objectives add arena trigger
scoreboard objectives add room trigger
scoreboard objectives add queue trigger
scoreboard objectives add surrender trigger
scoreboard objectives add spectator trigger

scoreboard objectives add scarena.math dummy
scoreboard players set #n1 scarena.math -1
scoreboard players set #3 scarena.math 3
scoreboard players set #32 scarena.math 32
scoreboard players set #48 scarena.math 48


# Initialize persistent scores and storages
execute unless score game.max_arenas scarena.main matches 1.. run scoreboard players set game.max_arenas scarena.main 3
execute unless score game.count scarena.main matches 0.. run scoreboard players set game.count scarena.main 0

execute unless score arena.reset scarena.main matches 1.. run scoreboard players set arena.reset scarena.main 20
execute unless score room.max_count scarena.main matches 1.. run scoreboard players set room.max_count scarena.main 9

execute unless score queue.timer scarena.main matches 0.. run scoreboard players set queue.timer scarena.main 0
execute unless score queue.players scarena.main matches 0.. run scoreboard players set queue.players scarena.main 0
execute unless score queue.min_players scarena.main matches 1.. run scoreboard players set queue.min_players scarena.main 2
execute unless score queue.max_players scarena.main matches 1.. run scoreboard players set queue.max_players scarena.main 4

execute unless data storage scarena:queue structures run data modify storage scarena:queue structures set value []
execute unless data storage scarena:queue rooms run data modify storage scarena:queue rooms set value []


# SpellCrafter options
scoreboard players set trader_spawn spellcrafter.options 0
