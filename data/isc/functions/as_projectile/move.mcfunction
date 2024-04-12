# Loops itself, number of iterations is equal to the projectile's speed

# Block collision
execute unless block ~ ~ ~ #isc:air run scoreboard players set @s isc.age 0
execute if score @s isc.age matches 1.. if entity @s[tag=isc.fireball] if block ~ ~ ~ minecraft:water run scoreboard players set @s isc.age 0

execute unless score @s isc.age matches 1.. run tp @s ^ ^ ^-0.25


# Entity collision
execute if score @s isc.age matches 1.. unless score @s isc.blind matches 1.. as @s[tag=!isc.laser] positioned ~ ~-1 ~ if entity @e[distance=..1.5,type=!#isc:untargetable,tag=!isc.spectator] run scoreboard players set @s isc.age 0


# Trail
execute if score @s isc.age matches 1.. as @s[tag=isc.magic_missile] run function isc:spells/magic_missile/trail
execute if score @s isc.age matches 1.. as @s[tag=isc.fireball] run function isc:spells/fireball/trail
execute if score @s isc.age matches 1.. as @s[tag=isc.laser] run function isc:spells/laser/trail


# Move
execute if score @s isc.age matches 1.. run tp @s ^ ^ ^0.25


# Next iteration
execute if score @s isc.blind matches 1.. run scoreboard players remove @s isc.blind 1
scoreboard players remove @s isc.age 1
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. if score @s isc.age matches 1.. at @s run function isc:as_projectile/move
