#> advancement reward
advancement revoke @s only spellcrafter:events/open_barrel


# Raycast search
scoreboard players set $success spellcrafter.tmp 0
scoreboard players set $iter spellcrafter.tmp 50
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute anchored eyes positioned ^ ^ ^ run function spellcrafter:as_player/events/open_barrel/raycast
