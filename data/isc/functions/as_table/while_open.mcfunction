#> [tick] as table, at barrel


# If barrel is closed, unlock table & drop items
execute if block ~ ~ ~ minecraft:barrel[open=false] run return run function isc:as_table/close/init


# If player not found, close barrel
scoreboard players operation $id isc.tmp = @s isc.id
execute unless entity @a[distance=..10,predicate=isc:match_id] run function isc:as_table/close/init


# TODO: update chest name to show mana cost (use inventory changed event?)


