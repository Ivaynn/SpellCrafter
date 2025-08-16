#> executed by #minecraft:load
tellraw @a ["",{text:"> ",color:"#965ed6",bold:true},{text:"Reloaded!",color:"gray"}]


# Gamerules
gamerule commandModificationBlockLimit 500000
gamerule spawnRadius 0
gamerule doTileDrops false
gamerule naturalRegeneration false
gamerule keepInventory true
gamerule sendCommandFeedback false
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


# Scoreboards
scoreboard objectives add scarena.event.relog minecraft.custom:leave_game
scoreboard objectives add scarena.event.death minecraft.custom:deaths


# SpellCrafter options
scoreboard players set trader_spawn spellcrafter.options 0





# Test: load structure
data modify storage scarena:tmp structure set value {name:"lobby", x:0, z:0}
function scarena:structure/place with storage scarena:tmp structure

data modify storage scarena:tmp structure set value {name:"lobby", x:0, z:0}
function scarena:structure/save with storage scarena:tmp structure
