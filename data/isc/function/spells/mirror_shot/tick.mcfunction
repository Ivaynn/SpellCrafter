#> [tick] as projectile, at @s


# Set stats to 0
scoreboard players set $success isc.tmp 0

scoreboard players set $damage isc.tmp 0
scoreboard players set $age isc.tmp 0
scoreboard players set $speed isc.tmp 0


# Get stats of nearby projectiles
tag @s add isc.self
execute as @e[limit=1,distance=..50,sort=nearest,type=minecraft:marker,tag=!isc.self,tag=!isc.kill,tag=isc.projectile] at @s run function isc:spells/mirror_shot/as_proj
tag @s remove isc.self


# If no projectiles, stop here
execute if score $success isc.tmp matches 0 run return 0


# Get copied data
data modify entity @s Tags set from storage isc:tmp copy.tags

scoreboard players operation @s isc.speed = $speed isc.tmp
scoreboard players operation @s isc.damage = $damage isc.tmp
scoreboard players operation @s isc.range = $range isc.tmp
scoreboard players operation @s isc.weight = $weight isc.tmp

scoreboard players operation @s isc.age = @s isc.range
scoreboard players operation @s isc.age *= #4 isc.math


# Effects
playsound minecraft:entity.illusioner.prepare_mirror player @a ^ ^ ^1 2 2
