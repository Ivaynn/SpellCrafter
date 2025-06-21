#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute summon minecraft:item_display run function spellcrafter:spells/toxic_cloud/as_display
playsound minecraft:entity.splash_potion.break player @a[distance=..100] ~ ~ ~ 2 1.8
