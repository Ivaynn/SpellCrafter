
# Get tmp scores
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind


# Hit
execute as @s[tag=isc.magic_missile] run function isc:spells/magic_missile/hit
execute as @s[tag=isc.fireball] run function isc:spells/fireball/hit


# Next spell...
execute if data entity @s data.isc.spells[0] run function isc:as_projectile/next_spell
kill @s[tag=isc.projectile]
