# Executed by a new projectile

data modify entity @s Tags set from storage isc:tmp copy.tags
data modify entity @s Rotation set from storage isc:tmp copy.rotation

execute at @s run tp @s ~ ~ ~ ~-30 ~

scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players operation @s isc.age = $age isc.tmp
scoreboard players operation @s isc.speed = $speed isc.tmp
scoreboard players operation @s isc.range = $range isc.tmp
scoreboard players operation @s isc.blind = $blind isc.tmp

execute if entity @s[tag=isc.random_dir] run function isc:spells/random_dir/cast
