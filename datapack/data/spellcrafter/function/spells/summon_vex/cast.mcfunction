#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:vex run function spellcrafter:spells/summon_vex/as_vex
playsound minecraft:entity.vex.ambient player @a[distance=..100] ~ ~ ~ 1 1
