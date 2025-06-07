#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute summon minecraft:wind_charge run function spellcrafter:spells/wind_charge/as_wind


# Effects
playsound minecraft:entity.breeze.shoot player @a[distance=..100] ~ ~ ~ 1 1
