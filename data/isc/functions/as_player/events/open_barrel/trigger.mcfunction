#> advancement reward
advancement revoke @s only isc:events/open_barrel


# Raycast search
scoreboard players set $success isc.tmp 0
scoreboard players set $iter isc.tmp 50
scoreboard players operation $id isc.tmp = @s isc.id
execute anchored eyes positioned ^ ^ ^ run function isc:as_player/events/open_barrel/raycast
