
fill ~2 ~1 ~1 ~-2 ~-1 ~-1 minecraft:air replace #isc:mineable
fill ~1 ~2 ~1 ~-1 ~-2 ~-1 minecraft:air replace #isc:mineable
fill ~1 ~1 ~2 ~-1 ~-1 ~-2 minecraft:air replace #isc:mineable

particle minecraft:dust{color:[0,0,0],scale:4} ~ ~ ~ 0.5 0.5 0.5 0 8 force @a
particle minecraft:portal ~ ~-.3 ~ 0.6 0.6 0.6 0.6 6 force @a

execute at @e[distance=..13,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..11,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..9,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..7,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.1
execute at @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.2
