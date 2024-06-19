#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:slime run function isc:spells/summon_slime/as_slime
playsound minecraft:entity.slime.squish_small player @a ~ ~ ~ 1 1
