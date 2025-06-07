#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:bat run function spellcrafter:spells/summon_bat/as_bat
playsound minecraft:entity.bat.ambient player @a[distance=..100] ~ ~ ~ 1 1
