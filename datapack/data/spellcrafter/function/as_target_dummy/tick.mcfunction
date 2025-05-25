#> [tick] as target dummy, at @s


particle minecraft:dust_color_transition{from_color:[0.4,0.7,0.8],scale:0.8,to_color:[1.0,1.0,1.0]} ~ ~.3 ~ .25 .35 .25 1 1 normal @a[distance=..100]

# Detect damage from all sources (including non-player, so advancements are not enough for this)
execute unless entity @s[nbt={AbsorptionAmount:2048.0f}] run function spellcrafter:as_target_dummy/hit
