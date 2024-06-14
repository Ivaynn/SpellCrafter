#> as table

execute at @s positioned ~ ~-1 ~ run function isc:as_table/close/init

execute at @s positioned ~ ~-1 ~ run setblock ~ ~ ~ minecraft:bedrock
execute at @s positioned ~ ~-1 ~ run function isc:as_table/place/setblock
