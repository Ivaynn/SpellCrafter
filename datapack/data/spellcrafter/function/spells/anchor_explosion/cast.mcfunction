#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 summon minecraft:block_display run function spellcrafter:spells/anchor_explosion/as_display
playsound minecraft:block.respawn_anchor.set_spawn player @a ~ ~ ~ 1 1.4
