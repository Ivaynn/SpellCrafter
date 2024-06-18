#> [tick] as projectile, at @s
#> recursive function (limited by score "$iter isc.tmp")


# Distance travelled
scoreboard players add @s isc.dist 1


# Block collision
scoreboard players set $wall_hit isc.tmp 0
execute if score @s isc.age matches 1.. as @s[tag=!isc.spell.ghost] at @s unless block ^.2 ^.2 ^ #isc:air run scoreboard players add $wall_hit isc.tmp 1
execute if score @s isc.age matches 1.. as @s[tag=!isc.spell.ghost] at @s unless block ^.2 ^-.2 ^ #isc:air run scoreboard players add $wall_hit isc.tmp 1
execute if score @s isc.age matches 1.. as @s[tag=!isc.spell.ghost] at @s unless block ^-.2 ^.2 ^ #isc:air run scoreboard players add $wall_hit isc.tmp 1
execute if score @s isc.age matches 1.. as @s[tag=!isc.spell.ghost] at @s unless block ^-.2 ^-.2 ^ #isc:air run scoreboard players add $wall_hit isc.tmp 1
execute if score @s isc.age matches 1.. if entity @s[tag=isc.spell.fireball] if block ~ ~ ~ minecraft:water run return run function isc:spells/fireball/extinguish

execute if score $wall_hit isc.tmp matches 1.. as @s[tag=!isc.spell.bouncy] run scoreboard players set @s isc.age 0
execute if score $wall_hit isc.tmp matches 1.. as @s[tag=isc.spell.bouncy] positioned ^ ^ ^-0.25 run function isc:spells/bouncy/init

execute unless score @s isc.age matches 1.. if score @s isc.speed matches 1.. run tp @s ^ ^ ^-0.25
execute unless score @s isc.age matches 1.. if score @s isc.speed matches ..-1 run tp @s ^ ^ ^0.25


# Entity collision
execute if score @s isc.age matches 1.. as @s[tag=!isc.spell.safe_shot] if score @s isc.blind matches 1.. at @s positioned ~ ~-1 ~ if entity @e[distance=..1.5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] run function isc:as_projectile/hit_entity
execute if score @s isc.age matches 1.. as @s[tag=!isc.spell.safe_shot] unless score @s isc.blind matches 1.. at @s positioned ~ ~-1 ~ if entity @e[distance=..1.5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run function isc:as_projectile/hit_entity
execute if score @s isc.age matches 1.. as @s[tag=isc.spell.safe_shot] unless score @s isc.blind matches 1.. at @s positioned ~ ~-1 ~ if entity @e[distance=..1.5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] run function isc:as_projectile/hit_entity
execute if score @s isc.blind matches 1.. run scoreboard players remove @s isc.blind 1


# Trail
execute if score @s isc.age matches 1.. run function isc:as_projectile/trail


# Move --> 0.25 = 1/4 blocks --> 4 iterations = 1 block
execute as @s[tag=!isc.spell.anchored] if score @s isc.speed matches 1.. if score @s isc.age matches 1.. at @s run tp @s ^ ^ ^0.25
execute as @s[tag=!isc.spell.anchored] if score @s isc.speed matches ..-1 if score @s isc.age matches 1.. at @s run tp @s ^ ^ ^-0.25


# Special cases
execute if score @s isc.speed matches 0 as @s[tag=!isc.spell.anchored] if score $spell.follow isc.tmp matches 1 if score @s isc.age matches 1.. at @s run tp @s ^ ^ ^0.25


# Next iteration
scoreboard players remove @s isc.age 1
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. if score @s isc.age matches 1.. at @s run function isc:as_projectile/move
