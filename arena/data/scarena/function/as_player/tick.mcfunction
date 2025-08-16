#> [tick] as player, at @s


# Scoreboard events
execute unless score @s scarena.event.relog matches 0.. run function scarena:as_player/events/first_join
execute if score @s scarena.event.relog matches 1.. run function scarena:as_player/events/relog
execute if score @s scarena.event.death matches 1.. run function scarena:as_player/events/respawn
scoreboard players set @s scarena.event.relog 0
scoreboard players set @s scarena.event.death 0

