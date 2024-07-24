#> as projectile, at @s
# tick, but only executes once because it ends with a kill command


# Hit targets
execute as @s[tag=isc.spell.magic_missile] run function isc:spells/magic_missile/hit
execute as @s[tag=isc.spell.fireball] run function isc:spells/fireball/hit
execute as @s[tag=isc.spell.revealing_bolt] run function isc:spells/revealing_bolt/hit
execute as @s[tag=isc.spell.arcane_reaper] run function isc:spells/arcane_reaper/hit
execute as @s[tag=isc.spell.shulker_bullet] run function isc:spells/shulker_bullet/hit
execute as @s[tag=isc.spell.poison_dart] run function isc:spells/poison_dart/hit
execute as @s[tag=isc.spell.freezing_bolt] run function isc:spells/freezing_bolt/hit
execute as @s[tag=isc.spell.drill] run function isc:spells/drill/hit
execute as @s[tag=isc.spell.boomerang] run function isc:spells/boomerang/hit
execute as @s[tag=isc.spell.null_shot] run function isc:spells/null_shot/hit
execute as @s[tag=isc.spell.kinetic_bolt] run function isc:spells/kinetic_bolt/hit
execute as @s[tag=isc.spell.arcane_shield] run function isc:spells/arcane_shield/hit
execute as @s[tag=isc.spell.healing_circle] run function isc:spells/healing_circle/hit
execute as @s[tag=isc.spell.toxic_cloud] run function isc:spells/toxic_cloud/hit
execute as @s[tag=isc.spell.wither_blast] run function isc:spells/wither_blast/hit
execute as @s[tag=isc.spell.big_drill] run function isc:spells/big_drill/hit
execute as @s[tag=isc.spell.vampiric_shot] run function isc:spells/vampiric_shot/hit
execute as @s[tag=isc.spell.drain_bolt] run function isc:spells/drain_bolt/hit
execute as @s[tag=isc.spell.mirror_shot] run function isc:spells/mirror_shot/hit

# Next spell...
execute if data entity @s data.isc.spells[0] run function isc:as_projectile/next_spell


# Remove self
kill @s[tag=isc.projectile]
