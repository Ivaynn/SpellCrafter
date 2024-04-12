
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.2
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a

scoreboard players set $damage isc.tmp 15
execute positioned ~ ~-1 ~ as @e[distance=..5,type=!#isc:untargetable] run function isc:damage/init

return 1
