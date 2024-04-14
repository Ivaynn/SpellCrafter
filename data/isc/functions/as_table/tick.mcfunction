#> [tick] as table, at @s


execute unless block ~ ~-1 ~ minecraft:barrel run function isc:as_table/break
execute if score @s isc.id matches 1.. positioned ~ ~-1 ~ run function isc:as_table/while_open
