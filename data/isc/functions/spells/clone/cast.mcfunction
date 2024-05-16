#> as projectile, on summon, at @s


# Check projectile cap
scoreboard players operation $projectile_count isc.tmp += $spell.clone isc.tmp
execute if score $projectile_count isc.tmp > projectile_cap isc.options run return 0


# Check clone cap
scoreboard players operation @s isc.clone += $spell.clone isc.tmp
execute if score @s isc.clone > clone_limit isc.options if score warnings isc.options matches 1 run tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Clone limit reached! ","color":"gray"},{"score":{"name":"@s","objective":"isc.clone"},"color":"gray"}]
execute if score @s isc.clone > clone_limit isc.options run return 0


# Multicast
execute as @s[tag=isc.spell.multicast] run data remove entity @s data.isc


# Get relevant data to create a copy
data remove storage isc:tmp copy
data modify storage isc:tmp copy.isc set from entity @s data.isc
data modify storage isc:tmp copy.tags set from entity @s Tags
data modify storage isc:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $age isc.tmp = @s isc.age
scoreboard players operation $speed isc.tmp = @s isc.speed
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $range isc.tmp = @s isc.range
scoreboard players operation $blind isc.tmp = @s isc.blind
scoreboard players operation $clone_count isc.tmp = @s isc.clone
scoreboard players operation $dist isc.tmp = @s isc.dist


# Starting rotation offset
scoreboard players set $r0_offset isc.tmp 10
scoreboard players operation $r0_offset isc.tmp *= $spell.clone isc.tmp

execute store result score $r0 isc.tmp run data get storage isc:tmp copy.rotation[0] 1
scoreboard players operation $r0 isc.tmp -= $r0_offset isc.tmp
execute store result entity @s[tag=!isc.spell.arcane_reaper] Rotation[0] float 1 run scoreboard players get $r0 isc.tmp


# Summon the clones
execute at @s run function isc:spells/clone/for_clone
