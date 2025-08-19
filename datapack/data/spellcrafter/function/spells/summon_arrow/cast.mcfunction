#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute summon minecraft:arrow run function spellcrafter:spells/summon_arrow/as_arrow
function spellcrafter:as_summon/check_limit/init


# Effects
playsound minecraft:entity.arrow.shoot player @a[distance=..100] ~ ~ ~ 1 1
