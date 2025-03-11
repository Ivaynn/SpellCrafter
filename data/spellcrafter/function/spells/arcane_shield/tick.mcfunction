#> [tick] as projectile, at @s


# Effects
particle minecraft:enchanted_hit ~ ~2 ~ 0.7 0.1 0.7 0 5 force @a
particle minecraft:enchanted_hit ~ ~-2 ~ 0.7 0.1 0.7 0 5 force @a

particle minecraft:enchanted_hit ~2 ~ ~ 0 0.7 0.7 0.1 5 force @a
particle minecraft:enchanted_hit ~-2 ~ ~ 0 0.7 0.7 0.1 5 force @a

particle minecraft:enchanted_hit ~ ~ ~2 0.7 0.7 0.1 0 5 force @a
particle minecraft:enchanted_hit ~ ~ ~-2 0.7 0.7 0.1 0 5 force @a


# Get stats of nearby projectiles
scoreboard players set $count spellcrafter.tmp 0
tag @s add spellcrafter.self
execute as @e[distance=..4,type=minecraft:marker,tag=spellcrafter.projectile,tag=!spellcrafter.self,tag=!spellcrafter.kill,predicate=!spellcrafter:match_id] at @s run function spellcrafter:spells/arcane_shield/as_proj
tag @s remove spellcrafter.self


# Lose lifetime for each projectile removed
scoreboard players operation @s spellcrafter.age -= $count spellcrafter.tmp
execute if score $count spellcrafter.tmp matches 1.. run playsound minecraft:entity.iron_golem.damage player @a ~ ~ ~ 1 1.4
