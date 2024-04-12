
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.6
particle minecraft:flame ^ ^ ^ 0.5 0.5 0.5 0.1 30 force @a

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/init
