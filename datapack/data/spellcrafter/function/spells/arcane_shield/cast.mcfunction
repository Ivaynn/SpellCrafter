#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute summon minecraft:item_display run function spellcrafter:spells/arcane_shield/as_display
playsound minecraft:entity.iron_golem.repair player @a[distance=..100] ~ ~ ~ 2 0.8
