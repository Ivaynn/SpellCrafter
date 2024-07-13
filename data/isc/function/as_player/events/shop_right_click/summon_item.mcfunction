#> as player

summon minecraft:item ~ ~ ~ {Tags:["isc.shop.tmp"], Item:{id:"minecraft:stone",count:1}}
data modify entity @e[distance=..0.001,limit=1,type=minecraft:item,tag=isc.shop.tmp] Item set from storage isc:tmp item
data modify entity @e[distance=..0.001,limit=1,type=minecraft:item,tag=isc.shop.tmp] Owner set from entity @s UUID
