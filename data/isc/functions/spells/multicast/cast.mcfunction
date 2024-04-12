tag @s remove isc.multicast


# Stats to transfer to other projectiles
scoreboard players operation $id isc.tmp = @s isc.id
data modify storage isc:tmp copy.rotation set from entity @s Rotation


# New projectile
scoreboard players set $multicast isc.tmp 1
execute summon minecraft:marker run function isc:as_projectile/summon
scoreboard players set $multicast isc.tmp 0
data remove entity @s data.isc.spells


# Self iterate
execute if data storage isc:tmp wand.spells[0] run function isc:spells/multicast/cast
