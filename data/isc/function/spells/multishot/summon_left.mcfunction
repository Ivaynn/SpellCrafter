#> execute summon (marker) at the position of the original projectile


# Get data from the original projectile
data modify entity @s Tags set from storage isc:tmp copy.tags
data modify entity @s Rotation set from storage isc:tmp copy.rotation

scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players operation @s isc.age = $age isc.tmp
scoreboard players operation @s isc.speed = $speed isc.tmp
scoreboard players operation @s isc.damage = $damage isc.tmp
scoreboard players operation @s isc.range = $range isc.tmp
scoreboard players operation @s isc.blind = $blind isc.tmp
scoreboard players operation @s isc.dist = $dist isc.tmp
scoreboard players operation @s isc.weight = $weight isc.tmp


# Re-apply certain modifiers
execute as @s[tag=isc.spell.chaotic] run function isc:spells/chaotic/cast
execute as @s[tag=isc.spell.random_dir] run return run function isc:spells/random_dir/cast
execute as @s[tag=isc.spell.casters_aim] run return run function isc:spells/casters_aim/cast
execute as @s[tag=isc.spell.casters_pull,tag=!isc.spell.casters_aim] run return run function isc:spells/casters_pull/cast
execute as @s[tag=isc.spell.aim_assist,tag=!isc.spell.casters_aim,tag=!isc.spell.casters_pull] run return run function isc:spells/aim_assist/cast
execute if score $spell.multicast isc.tmp matches 1 run return run function isc:spells/multicast/offset


# Rotation
scoreboard players set $r0_offset isc.tmp -25
scoreboard players operation $r0_offset isc.tmp *= $spell.multishot isc.tmp
scoreboard players operation $r0_offset isc.tmp += $r0 isc.tmp

execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0_offset isc.tmp
