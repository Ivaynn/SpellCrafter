#> as marker, at @s

execute if block ~ ~ ~ #minecraft:replaceable run return run function spellcrafter:as_table/place/init
execute positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:replaceable run return run function spellcrafter:as_table/place/init

loot spawn ~ ~ ~ loot spellcrafter:egg/table
