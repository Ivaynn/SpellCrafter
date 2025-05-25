#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute positioned ^ ^ ^2 summon minecraft:item_display run function spellcrafter:spells/magic_shield/as_display
playsound minecraft:block.glass.hit player @a ^ ^ ^2 1 2
