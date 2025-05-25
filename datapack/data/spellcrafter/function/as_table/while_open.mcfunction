#> [tick] as table, at barrel


# If barrel is closed, unlock table & drop items
execute if block ~ ~ ~ minecraft:barrel[open=false] run return run function spellcrafter:as_table/close/init


# If player not found, close barrel
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute unless entity @a[distance=..10,predicate=spellcrafter:match_id] run function spellcrafter:as_table/close/init
