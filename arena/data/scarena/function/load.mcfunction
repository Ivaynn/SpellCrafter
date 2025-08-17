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


# Ensure everything is loaded
execute positioned 0 0 0 run forceload add ~60 ~60 ~-60 ~-60
execute positioned 1000 0 0 run forceload add ~60 ~60 ~-60 ~-60
execute positioned -1000 0 0 run forceload add ~60 ~60 ~-60 ~-60
execute positioned 0 0 1000 run forceload add ~60 ~60 ~-60 ~-60
execute positioned 0 0 -1000 run forceload add ~60 ~60 ~-60 ~-60


# Scoreboards
scoreboard objectives add scarena.main dummy
scoreboard objectives add scarena.player.relog minecraft.custom:leave_game
scoreboard objectives add scarena.player.death minecraft.custom:deaths
scoreboard objectives add scarena.player.state dummy
scoreboard objectives add scarena.player.gameid dummy

scoreboard objectives add spawn trigger
scoreboard objectives add arena trigger
scoreboard objectives add private trigger
scoreboard objectives add queue trigger
scoreboard objectives add surrender trigger
scoreboard objectives add spectator trigger


# SpellCrafter options
scoreboard players set trader_spawn spellcrafter.options 0
