#> as item_display, at @s

data modify storage spellcrafter:tmp rotation set from entity @s Rotation
data remove storage spellcrafter:tmp wand
data modify storage spellcrafter:tmp wand.spells set value [101]

execute summon minecraft:marker run function spellcrafter:as_projectile/summon
