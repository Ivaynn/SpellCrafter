#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:endermite run function spellcrafter:spells/summon_endermite/as_endermite
playsound minecraft:entity.endermite.ambient player @a[distance=..100] ~ ~ ~ 1 1
