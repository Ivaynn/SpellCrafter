
fill ~ ~ ~ ~ ~ ~ minecraft:air replace #isc:mineable

particle minecraft:dust{color:[0,0,0],scale:2} ~ ~ ~ 0.3 0.3 0.3 0 3 force @a
particle minecraft:portal ~ ~-.3 ~ 0.3 0.3 0.3 0.3 3 force @a

execute at @e[distance=..7,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
