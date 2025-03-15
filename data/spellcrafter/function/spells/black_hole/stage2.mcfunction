
particle minecraft:dust{color:[0,0,0],scale:2} ~ ~ ~ 0.1 0.1 0.1 0 1 force @a
particle minecraft:portal ~ ~-.3 ~ 0.2 0.2 0.2 0.2 2 force @a

execute at @e[distance=..5,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.05
execute at @e[distance=..3,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] positioned ~ ~1 ~ facing entity @s feet positioned ~ ~-1 ~ as @e[distance=..0.001,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run tp @s ^ ^ ^.05

execute unless score destructive_spells spellcrafter.options matches 1 run return 0

execute unless block ~ ~ ~ #minecraft:wither_immune run setblock ~ ~ ~ minecraft:air destroy
