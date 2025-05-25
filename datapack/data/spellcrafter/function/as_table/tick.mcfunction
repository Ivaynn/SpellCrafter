#> [tick] as table, at @s


execute unless block ~ ~-1 ~ minecraft:barrel run function spellcrafter:as_table/break
execute if score @s spellcrafter.id matches 1.. positioned ~ ~-1 ~ run function spellcrafter:as_table/while_open
