#> as player

summon minecraft:item ~ ~ ~ {Tags:["spellcrafter.shop.tmp"], Item:{id:"minecraft:stone",count:1}}
data modify entity @e[distance=..0.001,limit=1,type=minecraft:item,tag=spellcrafter.shop.tmp] Item set from storage spellcrafter:tmp item
data modify entity @e[distance=..0.001,limit=1,type=minecraft:item,tag=spellcrafter.shop.tmp] Owner set from entity @s UUID
