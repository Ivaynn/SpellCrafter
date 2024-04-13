#> execute summon (marker) at the position of the original projectile


# Get data from the original projectile
data modify entity @s Tags set from storage isc:tmp copy.tags
data modify entity @s Rotation set from storage isc:tmp copy.rotation

scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players operation @s isc.age = $age isc.tmp
scoreboard players operation @s isc.speed = $speed isc.tmp
scoreboard players operation @s isc.range = $range isc.tmp
scoreboard players operation @s isc.blind = $blind isc.tmp


# Rotation offset (left)
execute at @s run tp @s ~ ~ ~ ~-30 ~


# If the projectile has random direction, apply it again
execute if entity @s[tag=isc.spell.random_dir] run function isc:spells/random_dir/cast
