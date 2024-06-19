
execute unless block ~ ~ ~ #minecraft:wither_immune run setblock ~ ~ ~ minecraft:air destroy

execute unless block ~ ~1 ~ #minecraft:wither_immune run setblock ~ ~1 ~ minecraft:air destroy
execute unless block ~ ~-1 ~ #minecraft:wither_immune run setblock ~ ~-1 ~ minecraft:air destroy
execute unless block ~1 ~ ~ #minecraft:wither_immune run setblock ~1 ~ ~ minecraft:air destroy
execute unless block ~-1 ~ ~ #minecraft:wither_immune run setblock ~-1 ~ ~ minecraft:air destroy
execute unless block ~ ~ ~1 #minecraft:wither_immune run setblock ~ ~ ~1 minecraft:air destroy
execute unless block ~ ~ ~-1 #minecraft:wither_immune run setblock ~ ~ ~-1 minecraft:air destroy

particle minecraft:dust{color:[0,0,0],scale:3} ~ ~ ~ 0.5 0.5 0.5 0 6 force @a
particle minecraft:portal ~ ~-.3 ~ 0.5 0.5 0.5 0.5 5 force @a

execute at @e[distance=..11,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..9,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..7,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run tp @s ^ ^ ^.1
