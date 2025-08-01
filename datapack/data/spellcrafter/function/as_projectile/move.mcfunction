#> [tick] as projectile, at @s
#> recursive function (limited by score "$iter spellcrafter.tmp")


# Anti-magic
execute at @s if block ~.5 ~ ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/remove
execute at @s if block ~-.5 ~ ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/remove
execute at @s if block ~ ~.5 ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/remove
execute at @s if block ~ ~-.5 ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/remove
execute at @s if block ~ ~ ~.5 #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/remove
execute at @s if block ~ ~ ~-.5 #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/remove


# Distance travelled
scoreboard players add @s spellcrafter.dist 1


# Block collision
scoreboard players set $wall_hit spellcrafter.tmp 0
execute if score @s spellcrafter.age matches 1.. as @s[tag=!spellcrafter.spell.ghost] at @s unless block ^.2 ^.2 ^ #spellcrafter:air run scoreboard players add $wall_hit spellcrafter.tmp 1
execute if score @s spellcrafter.age matches 1.. as @s[tag=!spellcrafter.spell.ghost] at @s unless block ^.2 ^-.2 ^ #spellcrafter:air run scoreboard players add $wall_hit spellcrafter.tmp 1
execute if score @s spellcrafter.age matches 1.. as @s[tag=!spellcrafter.spell.ghost] at @s unless block ^-.2 ^.2 ^ #spellcrafter:air run scoreboard players add $wall_hit spellcrafter.tmp 1
execute if score @s spellcrafter.age matches 1.. as @s[tag=!spellcrafter.spell.ghost] at @s unless block ^-.2 ^-.2 ^ #spellcrafter:air run scoreboard players add $wall_hit spellcrafter.tmp 1
execute if score @s spellcrafter.age matches 1.. if entity @s[tag=spellcrafter.spell.fireball] if block ~ ~ ~ minecraft:water run return run function spellcrafter:spells/fireball/extinguish

execute if score $wall_hit spellcrafter.tmp matches 1.. as @s[tag=!spellcrafter.spell.bouncy] run scoreboard players set @s spellcrafter.age 0
execute if score $wall_hit spellcrafter.tmp matches 1.. as @s[tag=spellcrafter.spell.bouncy] positioned ^ ^ ^-0.25 run function spellcrafter:spells/bouncy/init

execute unless score @s spellcrafter.age matches 1.. if score @s spellcrafter.speed matches 1.. run tp @s ^ ^ ^-0.25
execute unless score @s spellcrafter.age matches 1.. if score @s spellcrafter.speed matches ..-1 run tp @s ^ ^ ^0.25


# Entity collision
execute if score @s spellcrafter.age matches 1.. as @s[tag=!spellcrafter.spell.safe_shot] if score @s spellcrafter.blind matches 1.. at @s positioned ~ ~-0.75 ~ if entity @e[distance=..1.5,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run function spellcrafter:as_projectile/hit_entity
execute if score @s spellcrafter.age matches 1.. as @s[tag=!spellcrafter.spell.safe_shot] unless score @s spellcrafter.blind matches 1.. at @s positioned ~ ~-0.75 ~ if entity @e[distance=..1.5,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:as_projectile/hit_entity
execute if score @s spellcrafter.age matches 1.. as @s[tag=spellcrafter.spell.safe_shot] unless score @s spellcrafter.blind matches 1.. at @s positioned ~ ~-0.75 ~ if entity @e[distance=..1.5,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run function spellcrafter:as_projectile/hit_entity
execute if score @s spellcrafter.blind matches 1.. run scoreboard players remove @s spellcrafter.blind 1


# Trail
execute if score @s spellcrafter.age matches 1.. run function spellcrafter:as_projectile/trail
execute unless score @s spellcrafter.age matches 1.. run return 0


# Move --> 0.25 = 1/4 blocks --> 4 iterations = 1 block
execute as @s[tag=!spellcrafter.spell.anchored] if score @s spellcrafter.speed matches 1.. if score @s spellcrafter.age matches 1.. at @s run tp @s ^ ^ ^0.25
execute as @s[tag=!spellcrafter.spell.anchored] if score @s spellcrafter.speed matches ..-1 if score @s spellcrafter.age matches 1.. at @s run tp @s ^ ^ ^-0.25


# Special cases
execute if score @s spellcrafter.speed matches 0 as @s[tag=!spellcrafter.spell.anchored] if score $spell.follow spellcrafter.tmp matches 1 if score @s spellcrafter.age matches 1.. at @s run tp @s ^ ^ ^0.25


# Next iteration
scoreboard players remove @s spellcrafter.age 1
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. if score @s spellcrafter.age matches 1.. at @s run function spellcrafter:as_projectile/move
