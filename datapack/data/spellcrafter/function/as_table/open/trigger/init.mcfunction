#> as player

tag @s remove spellcrafter.player.open_table


# Raycast search
scoreboard players set $iter spellcrafter.tmp 50
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute anchored eyes positioned ^ ^ ^ run function spellcrafter:as_table/open/trigger/raycast
