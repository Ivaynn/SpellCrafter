#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:pufferfish run function isc:spells/summon_pufferfish/as_pufferfish
playsound minecraft:entity.puffer_fish.ambient player @a ~ ~ ~ 1 1
