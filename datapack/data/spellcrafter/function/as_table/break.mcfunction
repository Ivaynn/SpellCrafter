#> as table, at @s

execute as @e[distance=..2,type=minecraft:item] if data entity @s {Item:{components:{"minecraft:custom_name":{color:"dark_gray",translate:"spellcrafter.table.name",fallback:"Wand Editor"}}}} run kill @s

kill @s[type=!minecraft:player]
setblock ~ ~-1 ~ minecraft:air

loot spawn ~ ~-.5 ~ loot spellcrafter:egg/table
