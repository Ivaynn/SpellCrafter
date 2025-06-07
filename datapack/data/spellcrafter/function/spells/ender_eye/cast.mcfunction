#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute summon minecraft:item_display run function spellcrafter:spells/ender_eye/as_display
playsound minecraft:block.beacon.power_select player @a[distance=..100] ~ ~ ~ 1 1.4
