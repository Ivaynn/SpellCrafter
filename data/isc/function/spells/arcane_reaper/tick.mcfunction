#> [tick] as projectile, at @s


# Set stats to 0
scoreboard players set $success isc.tmp 0

scoreboard players set $damage isc.tmp 0
scoreboard players set $age isc.tmp 0
scoreboard players set $speed isc.tmp 0


# Get stats of nearby projectiles
tag @s add isc.self
execute as @e[distance=..5,type=minecraft:marker,tag=!isc.self,tag=!isc.kill,tag=isc.projectile] at @s run function isc:spells/arcane_reaper/as_proj
tag @s remove isc.self


# If no projectiles, stop here
execute if score $success isc.tmp matches 0 run return 0


# Nerf
scoreboard players operation $damage isc.tmp /= #2 isc.math
scoreboard players operation $age isc.tmp /= #2 isc.math
scoreboard players operation $speed isc.tmp /= #2 isc.math


# Get positive stats
execute if score $damage isc.tmp matches 1.. run scoreboard players operation @s isc.damage += $damage isc.tmp
execute if score $age isc.tmp matches 1.. run scoreboard players operation @s isc.age += $age isc.tmp
execute if score $speed isc.tmp matches 1.. run scoreboard players operation @s isc.speed += $speed isc.tmp


# Effects
playsound minecraft:entity.evoker.prepare_summon player @a ^ ^ ^3 2 1.8
