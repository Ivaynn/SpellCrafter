#> as table, at @s

execute as @e[distance=..2,type=minecraft:item] if data entity @s {Item:{components:{"minecraft:custom_name":'{"color":"dark_aqua","text":"Wand Editor"}'}}} run kill @s

kill @s[type=!minecraft:player]
setblock ~ ~-1 ~ minecraft:air

# TODO: loot spawn a placeable table
