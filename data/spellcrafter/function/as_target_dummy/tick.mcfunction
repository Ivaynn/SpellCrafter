#> [tick] as target dummy, at @s

particle minecraft:dust_color_transition{from_color:[0.4,0.7,0.8],scale:0.8,to_color:[1.0,1.0,1.0]} ~ ~.3 ~ .25 .35 .25 1 1 normal @a[distance=..100]

execute as @s[tag=!spellcrafter.caster] if predicate spellcrafter:holding_wand run function spellcrafter:as_target_dummy/equip
execute as @s[tag=spellcrafter.caster] unless predicate spellcrafter:holding_wand run function spellcrafter:as_target_dummy/unequip

execute unless entity @s[nbt={Health:1024.0f}] run function spellcrafter:as_target_dummy/hit
