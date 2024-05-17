#> as projectile, at @s


# Freeze
fill ~2 ~1 ~1 ~-2 ~-1 ~-1 minecraft:frosted_ice replace minecraft:water
fill ~1 ~2 ~1 ~-1 ~-2 ~-1 minecraft:frosted_ice replace minecraft:water
fill ~1 ~1 ~2 ~-1 ~-1 ~-2 minecraft:frosted_ice replace minecraft:water


# Effects
execute as @s[tag=isc.spell.hidden] run return 0
execute as @s[tag=isc.spell.rainbow] run return run function isc:spells/rainbow/trail
particle minecraft:snowflake ~ ~ ~ 0 0 0 0 0 force @a
