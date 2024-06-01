#> [tick] as projectile, at @s


# Effects
particle minecraft:enchanted_hit ~ ~2 ~ 0.7 0.1 0.7 0 5 force @a
particle minecraft:enchanted_hit ~ ~-2 ~ 0.7 0.1 0.7 0 5 force @a

particle minecraft:enchanted_hit ~2 ~ ~ 0 0.7 0.7 0.1 5 force @a
particle minecraft:enchanted_hit ~-2 ~ ~ 0 0.7 0.7 0.1 5 force @a

particle minecraft:enchanted_hit ~ ~ ~2 0.7 0.7 0.1 0 5 force @a
particle minecraft:enchanted_hit ~ ~ ~-2 0.7 0.7 0.1 0 5 force @a


# Get stats of nearby projectiles
scoreboard players set $count isc.tmp 0
tag @s add isc.self
execute as @e[distance=..4,type=minecraft:marker,tag=isc.projectile,tag=!isc.self,tag=!isc.kill,predicate=!isc:match_id] at @s run function isc:spells/arcane_shield/as_proj
tag @s remove isc.self


# Lose lifetime for each projectile removed
scoreboard players operation @s isc.age -= $count isc.tmp
execute if score $count isc.tmp matches 1.. run playsound minecraft:entity.iron_golem.damage player @a ~ ~ ~ 1 1.4
