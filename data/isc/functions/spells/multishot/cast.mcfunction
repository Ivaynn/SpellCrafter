tag @s remove isc.multishot

data modify storage isc:tmp copy.tags set from entity @s Tags
data modify storage isc:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $age isc.tmp = @s isc.age
scoreboard players operation $speed isc.tmp = @s isc.speed
scoreboard players operation $range isc.tmp = @s isc.range
scoreboard players operation $blind isc.tmp = @s isc.blind

execute summon minecraft:marker run function isc:spells/multishot/summon_left
execute summon minecraft:marker run function isc:spells/multishot/summon_right
