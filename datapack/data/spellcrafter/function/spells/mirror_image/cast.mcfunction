#> as projectile, on summon, at @s
# instant cast


# Find the caster to mirror
execute as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] run function spellcrafter:spells/mirror_image/as_caster


# Effects
playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 1 0.8
particle minecraft:campfire_cosy_smoke ~ ~.3 ~ .1 .3 .1 0.1 10 force @a[distance=..100]
