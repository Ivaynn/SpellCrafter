#> as projectile, at @s


# Effects
execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
particle minecraft:snowflake ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]


# Freeze
execute unless score destructive_spells spellcrafter.options matches 1 run return 0
fill ~2 ~1 ~1 ~-2 ~-1 ~-1 minecraft:frosted_ice replace minecraft:water
fill ~1 ~2 ~1 ~-1 ~-2 ~-1 minecraft:frosted_ice replace minecraft:water
fill ~1 ~1 ~2 ~-1 ~-1 ~-2 minecraft:frosted_ice replace minecraft:water
