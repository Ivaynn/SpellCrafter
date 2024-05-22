#> as projectile, at @s


# Create a projectile with the spell data
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $clone_count isc.tmp = @s isc.clone
execute if score @s isc.speed matches ..-1 at @s run tp @s ~ ~ ~ facing ^ ^ ^-1
data modify storage isc:tmp rotation set from entity @s Rotation
data remove storage isc:tmp wand
data modify storage isc:tmp wand.spells set from entity @s data.isc.spells
data modify storage isc:tmp wand.mod set from entity @s data.isc.mod

execute summon minecraft:marker run function isc:as_projectile/summon
