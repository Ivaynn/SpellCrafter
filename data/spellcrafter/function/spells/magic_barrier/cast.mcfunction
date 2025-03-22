#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute positioned ^ ^ ^2 summon minecraft:item_display run function spellcrafter:spells/magic_barrier/as_display
playsound minecraft:block.amethyst_block.fall player @a ^ ^ ^2 1 0.5
