
particle minecraft:explosion ^ ^ ^ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 2

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/init
