
particle minecraft:dust{color:[0,0,0],scale:4} ~ ~ ~ 0.7 0.7 0.7 0 10 force @a
particle minecraft:portal ~ ~-.3 ~ 0.7 0.7 0.7 0.7 7 force @a

execute at @e[distance=..15,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..13,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..11,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..9,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..7,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.1
execute at @e[distance=..5,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.2
execute at @e[distance=..3,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.3

execute unless score destructive_spells spellcrafter.options matches 1 run return 0

execute unless block ~ ~ ~ #minecraft:wither_immune run setblock ~ ~ ~ minecraft:air destroy

execute unless block ~ ~1 ~ #minecraft:wither_immune run setblock ~ ~1 ~ minecraft:air destroy
execute unless block ~ ~-1 ~ #minecraft:wither_immune run setblock ~ ~-1 ~ minecraft:air destroy
execute unless block ~1 ~ ~ #minecraft:wither_immune run setblock ~1 ~ ~ minecraft:air destroy
execute unless block ~-1 ~ ~ #minecraft:wither_immune run setblock ~-1 ~ ~ minecraft:air destroy
execute unless block ~ ~ ~1 #minecraft:wither_immune run setblock ~ ~ ~1 minecraft:air destroy
execute unless block ~ ~ ~-1 #minecraft:wither_immune run setblock ~ ~ ~-1 minecraft:air destroy

execute unless block ~1 ~1 ~ #minecraft:wither_immune run setblock ~1 ~1 ~ minecraft:air destroy
execute unless block ~1 ~-1 ~ #minecraft:wither_immune run setblock ~1 ~-1 ~ minecraft:air destroy
execute unless block ~-1 ~1 ~ #minecraft:wither_immune run setblock ~-1 ~1 ~ minecraft:air destroy
execute unless block ~-1 ~-1 ~ #minecraft:wither_immune run setblock ~-1 ~-1 ~ minecraft:air destroy
execute unless block ~ ~1 ~1 #minecraft:wither_immune run setblock ~ ~1 ~1 minecraft:air destroy
execute unless block ~ ~1 ~-1 #minecraft:wither_immune run setblock ~ ~1 ~-1 minecraft:air destroy
execute unless block ~ ~-1 ~1 #minecraft:wither_immune run setblock ~ ~-1 ~1 minecraft:air destroy
execute unless block ~ ~-1 ~-1 #minecraft:wither_immune run setblock ~ ~-1 ~-1 minecraft:air destroy
execute unless block ~1 ~ ~1 #minecraft:wither_immune run setblock ~1 ~ ~1 minecraft:air destroy
execute unless block ~1 ~ ~-1 #minecraft:wither_immune run setblock ~1 ~ ~-1 minecraft:air destroy
execute unless block ~-1 ~ ~1 #minecraft:wither_immune run setblock ~-1 ~ ~1 minecraft:air destroy
execute unless block ~-1 ~ ~-1 #minecraft:wither_immune run setblock ~-1 ~ ~-1 minecraft:air destroy

execute unless block ~1 ~1 ~1 #minecraft:wither_immune run setblock ~1 ~1 ~1 minecraft:air destroy
execute unless block ~1 ~1 ~-1 #minecraft:wither_immune run setblock ~1 ~1 ~-1 minecraft:air destroy
execute unless block ~1 ~-1 ~1 #minecraft:wither_immune run setblock ~1 ~-1 ~1 minecraft:air destroy
execute unless block ~1 ~-1 ~-1 #minecraft:wither_immune run setblock ~1 ~-1 ~-1 minecraft:air destroy
execute unless block ~-1 ~1 ~1 #minecraft:wither_immune run setblock ~-1 ~1 ~1 minecraft:air destroy
execute unless block ~-1 ~1 ~-1 #minecraft:wither_immune run setblock ~-1 ~1 ~-1 minecraft:air destroy
execute unless block ~-1 ~-1 ~1 #minecraft:wither_immune run setblock ~-1 ~-1 ~1 minecraft:air destroy
execute unless block ~-1 ~-1 ~-1 #minecraft:wither_immune run setblock ~-1 ~-1 ~-1 minecraft:air destroy
