# Summons a new marker to continue the spell list

data modify storage isc:tmp wand.spells set from entity @s data.isc.spells

scoreboard players operation $id isc.tmp = @s isc.id
data modify storage isc:tmp copy.rotation set from entity @s Rotation
execute summon minecraft:marker run function isc:as_projectile/summon
