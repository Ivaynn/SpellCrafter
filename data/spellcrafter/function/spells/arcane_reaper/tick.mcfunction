#> [tick] as projectile, at @s


# Set stats to 0
scoreboard players set $success spellcrafter.tmp 0

scoreboard players set $damage spellcrafter.tmp 0
scoreboard players set $age spellcrafter.tmp 0
scoreboard players set $speed spellcrafter.tmp 0


# Get stats of nearby projectiles
tag @s add spellcrafter.self
execute as @e[distance=..5,type=minecraft:marker,tag=!spellcrafter.self,tag=!spellcrafter.kill,tag=spellcrafter.projectile] at @s run function spellcrafter:spells/arcane_reaper/as_proj
tag @s remove spellcrafter.self


# If no projectiles, stop here
execute if score $success spellcrafter.tmp matches 0 run return 0


# Nerf
scoreboard players operation $damage spellcrafter.tmp /= #2 spellcrafter.math
scoreboard players operation $age spellcrafter.tmp /= #2 spellcrafter.math
scoreboard players operation $speed spellcrafter.tmp /= #2 spellcrafter.math


# Get positive stats
execute if score $damage spellcrafter.tmp matches 1.. run scoreboard players operation @s spellcrafter.damage += $damage spellcrafter.tmp
execute if score $age spellcrafter.tmp matches 1.. run scoreboard players operation @s spellcrafter.age += $age spellcrafter.tmp
execute if score $speed spellcrafter.tmp matches 1.. run scoreboard players operation @s spellcrafter.speed += $speed spellcrafter.tmp


# Effects
playsound minecraft:entity.evoker.prepare_summon player @a ~ ~ ~ 2 1.8
