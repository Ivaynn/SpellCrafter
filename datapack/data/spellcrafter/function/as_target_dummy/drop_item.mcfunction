#> as target dummy, at @s

execute unless data entity @s equipment.mainhand run return 0

summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone",count:1b},Tags:["spellcrafter.tmp"]}
data modify entity @e[limit=1,distance=..0.001,type=minecraft:item,tag=spellcrafter.tmp] Item set from entity @s equipment.mainhand
tag @e[limit=1,distance=..0.001,type=minecraft:item,tag=spellcrafter.tmp] remove spellcrafter.tmp
data remove entity @s equipment.mainhand
