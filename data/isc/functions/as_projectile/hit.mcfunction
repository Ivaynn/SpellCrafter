#> as projectile, at @s
# tick, but only executes once because it ends with a kill command


# Hit targets
execute as @s[tag=isc.spell.magic_missile] run function isc:spells/magic_missile/hit
execute as @s[tag=isc.spell.fireball] run function isc:spells/fireball/hit


# Next spell...
execute if data entity @s data.isc.spells[0] run function isc:as_projectile/next_spell


# Remove self
kill @s[tag=isc.projectile]
