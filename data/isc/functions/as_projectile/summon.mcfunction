# Executed by a new projectile - player has isc.tmp tag
tag @s add isc.projectile


# Reset stats
scoreboard players set @s isc.speed 0
scoreboard players set @s isc.range 0
scoreboard players set @s isc.damage 0


# Blind frames: don't hit entities for X iterations
execute if score $new_cast isc.tmp matches 1 run scoreboard players set @s isc.blind 15
execute unless score $new_cast isc.tmp matches 1 run scoreboard players set @s isc.blind 5


# Get caster id
scoreboard players operation @s isc.id = $id isc.tmp


# Rotation
data modify entity @s Rotation set from storage isc:tmp copy.rotation


# Get tags for the next projectile & its modifiers
data remove storage isc:tmp wand.first
execute store result score $result isc.tmp run function isc:as_projectile/cast


# Ensure stats aren't negative
execute unless score @s isc.range matches 0.. run scoreboard players set @s isc.range 0
execute unless score @s isc.speed matches 1.. run scoreboard players set @s isc.speed 1
execute unless score @s isc.damage matches 0.. run scoreboard players set @s isc.damage 0


# If result is -1, there are no more spells. Return here
execute if score $result isc.tmp matches -1 run kill @s
execute if score $result isc.tmp matches -1 run return 0


# Get range
scoreboard players operation @s isc.age = @s isc.range
scoreboard players operation @s isc.age *= #4 isc.math
scoreboard players operation @s isc.age *= range_mod isc.options
scoreboard players operation @s isc.age /= #100 isc.math


# Save data for the stored spells (next projectiles)
data modify entity @s data.isc.spells set from storage isc:tmp wand.spells


# Apply modifiers
execute as @s[tag=isc.random_dir] at @s run function isc:spells/random_dir/cast
execute as @s[tag=isc.multishot] at @s run function isc:spells/multishot/cast
execute as @s[tag=isc.duplicate] at @s run function isc:spells/duplicate/cast
