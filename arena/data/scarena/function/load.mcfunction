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
gamerule locatorBar false


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
scoreboard objectives add scarena.player.relog minecraft.custom:minecraft.leave_game
scoreboard objectives add scarena.player.death minecraft.custom:minecraft.deaths
scoreboard objectives add scarena.player.state dummy
scoreboard objectives add scarena.player.room_id dummy
scoreboard objectives add scarena.player.kills minecraft.custom:minecraft.player_kills
scoreboard objectives add scarena.player.id dummy

scoreboard objectives add scarena.stats.time minecraft.custom:minecraft.play_time
scoreboard objectives add scarena.stats.arena.kills dummy
scoreboard objectives add scarena.stats.arena.deaths dummy
scoreboard objectives add scarena.stats.game.kills dummy
scoreboard objectives add scarena.stats.game.deaths dummy
scoreboard objectives add scarena.stats.game.wins dummy
scoreboard objectives add scarena.stats.game.count dummy

scoreboard objectives add scarena.game.id dummy
scoreboard objectives add scarena.game.round dummy
scoreboard objectives add scarena.game.slot dummy
scoreboard objectives add scarena.game.timer dummy
scoreboard objectives add scarena.game.x dummy
scoreboard objectives add scarena.game.z dummy

scoreboard objectives add scarena.health dummy {text:"❤",color:"red"}
scoreboard objectives modify scarena.health numberformat styled {color:"red"}
scoreboard objectives setdisplay below_name scarena.health 

scoreboard objectives add scarena.game.lives dummy
scoreboard objectives setdisplay list scarena.game.lives

scoreboard objectives add spawn trigger
scoreboard objectives add arena trigger
scoreboard objectives add room trigger
scoreboard objectives add queue trigger
scoreboard objectives add surrender trigger
scoreboard objectives add spectator trigger
scoreboard objectives add stats trigger
scoreboard objectives add ready trigger

scoreboard objectives add scarena.math dummy
scoreboard players set #n1 scarena.math -1
scoreboard players set #2 scarena.math 2
scoreboard players set #3 scarena.math 3
scoreboard players set #5 scarena.math 5
scoreboard players set #32 scarena.math 32
scoreboard players set #48 scarena.math 48
scoreboard players set #1k scarena.math 1000


# Initialize persistent scores and storages
execute unless score game.instances scarena.main matches 0.. run scoreboard players set game.instances scarena.main 0
execute unless score game.max_instances scarena.main matches 1.. run scoreboard players set game.max_instances scarena.main 3
execute unless score game.round_time scarena.main matches 200.. run scoreboard players set game.round_time scarena.main 6000
execute unless score game.lives scarena.main matches 1.. run scoreboard players set game.lives scarena.main 6

execute unless score arena.timer scarena.main matches 1.. run scoreboard players set arena.timer scarena.main 20
execute unless score arena.interval scarena.main matches 1200.. run scoreboard players set arena.interval scarena.main 36000
execute unless score room.max_count scarena.main matches 0.. run scoreboard players set room.max_count scarena.main 9

execute unless score queue.timer scarena.main matches 0.. run scoreboard players set queue.timer scarena.main 0
execute unless score queue.players scarena.main matches 0.. run scoreboard players set queue.players scarena.main 0
execute unless score queue.min_players scarena.main matches 1.. run scoreboard players set queue.min_players scarena.main 2
execute unless score queue.max_players scarena.main matches 1..9 run scoreboard players set queue.max_players scarena.main 4

execute unless data storage scarena:queue structures run data modify storage scarena:queue structures set value []
execute unless data storage scarena:queue rooms run data modify storage scarena:queue rooms set value []
execute unless data storage scarena:stats raw run data modify storage scarena:stats raw set value {}


# Teams
team add lobby
team modify lobby color gray
team modify lobby nametagVisibility hideForOtherTeams
team modify lobby collisionRule never
team modify lobby friendlyFire false
team modify lobby deathMessageVisibility never

team add rooms
team modify rooms color green
team modify rooms nametagVisibility never
team modify rooms deathMessageVisibility never
team modify rooms friendlyFire true

team add arena
team modify arena color gold
team modify arena nametagVisibility always
team modify arena seeFriendlyInvisibles false
team modify arena friendlyFire true

team add game
team modify game color dark_purple
team modify game nametagVisibility always
team modify game seeFriendlyInvisibles false
team modify game friendlyFire true


# SpellCrafter options
scoreboard players set trader_spawn spellcrafter.options 0
