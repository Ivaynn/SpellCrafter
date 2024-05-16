#> execute summon (marker) at the position of the original projectile


# Get data from the original projectile
data modify entity @s data.isc set from storage isc:tmp copy.isc
data modify entity @s Tags set from storage isc:tmp copy.tags
data modify entity @s Rotation set from storage isc:tmp copy.rotation

scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players operation @s isc.age = $age isc.tmp
scoreboard players operation @s isc.speed = $speed isc.tmp
scoreboard players operation @s isc.damage = $damage isc.tmp
scoreboard players operation @s isc.range = $range isc.tmp
scoreboard players operation @s isc.blind = $blind isc.tmp
scoreboard players operation @s isc.clone = $clone_count isc.tmp
scoreboard players operation @s isc.dist = $dist isc.tmp


# Re-apply direction modifiers
execute as @s[tag=isc.spell.random_dir] run return run function isc:spells/random_dir/cast
execute if score $spell.multicast isc.tmp matches 1 run return run function isc:spells/multicast/offset


# Rotate
scoreboard players add $r0 isc.tmp 20
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
