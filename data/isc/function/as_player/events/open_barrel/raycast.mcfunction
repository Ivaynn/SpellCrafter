#> as player, raycast
#> recursive function (limited by scores "$iter isc.tmp", "$success isc.tmp")


# Check nearby tables
execute positioned ~ ~.5 ~ as @e[distance=..1,sort=nearest,type=minecraft:block_display,tag=isc.table] if score $success isc.tmp matches 0 at @s positioned ~ ~-1 ~ if predicate isc:is_open_barrel store result score $success isc.tmp run function isc:as_player/events/open_barrel/confirm


# Next iteration
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. unless score $success isc.tmp matches 1 positioned ^ ^ ^0.2 run function isc:as_player/events/open_barrel/raycast
