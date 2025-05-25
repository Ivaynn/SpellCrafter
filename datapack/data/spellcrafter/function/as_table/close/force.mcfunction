#> as table

execute at @s positioned ~ ~-1 ~ run function spellcrafter:as_table/close/init

execute at @s positioned ~ ~-1 ~ run setblock ~ ~ ~ minecraft:bedrock
execute at @s positioned ~ ~-1 ~ run function spellcrafter:as_table/place/setblock
