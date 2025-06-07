#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:goat run function spellcrafter:spells/angry_goat/as_goat
playsound minecraft:entity.goat.screaming.ambient player @a[distance=..100] ~ ~ ~ 1 1
