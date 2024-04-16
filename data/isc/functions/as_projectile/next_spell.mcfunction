#> as projectile, at @s


# Create a projectile with the spell data
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $clone_count isc.tmp = @s isc.clone
data modify storage isc:tmp rotation set from entity @s Rotation
data remove storage isc:tmp wand
data modify storage isc:tmp wand.spells set from entity @s data.isc.spells

execute summon minecraft:marker run function isc:as_projectile/summon
