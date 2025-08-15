#> as projectile, on summon, at @s
# instant cast


# Remove projectiles
execute as @e[distance=..15,type=minecraft:marker,tag=spellcrafter.projectile] run function spellcrafter:spells/counterspell/as_proj


# Remove summons
execute as @e[distance=..15,type=#spellcrafter:summon,tag=spellcrafter.summon] run function spellcrafter:spells/counterspell/as_summon


# Effects
particle minecraft:large_smoke ~ ~ ~ 3 3 3 0.6 50 force @a[distance=..100]
playsound minecraft:entity.illusioner.prepare_mirror player @a[distance=..100] ~ ~ ~ 2 1.2
