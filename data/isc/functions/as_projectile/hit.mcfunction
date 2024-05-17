#> as projectile, at @s
# tick, but only executes once because it ends with a kill command


# Hit targets
execute as @s[tag=isc.spell.magic_missile] run function isc:spells/magic_missile/hit
execute as @s[tag=isc.spell.fireball] run function isc:spells/fireball/hit
execute as @s[tag=isc.spell.revealing_bolt] run function isc:spells/revealing_bolt/hit
execute as @s[tag=isc.spell.arcane_reaper] run function isc:spells/arcane_reaper/hit
execute as @s[tag=isc.spell.shulker_bullet] run function isc:spells/shulker_bullet/hit
execute as @s[tag=isc.spell.poison_dart] run function isc:spells/poison_dart/hit


# Next spell...
execute if data entity @s data.isc.spells[0] run function isc:as_projectile/next_spell


# Remove self
kill @s[tag=isc.projectile]
