#> as item_display, at @s

data modify storage spellcrafter:tmp rotation set from entity @s Rotation
data remove storage spellcrafter:tmp wand

# Range depends on remaining lifetime: from 30 to 10 blocks, in steps of 5
# This assumes base range is 15, range_inc:14 adds 5, and range_dec:13 removes 5
execute if score @s spellcrafter.age matches ..40 run data modify storage spellcrafter:tmp wand.spells set value [13,79]
execute if score @s spellcrafter.age matches 41..80 run data modify storage spellcrafter:tmp wand.spells set value [79]
execute if score @s spellcrafter.age matches 81..120 run data modify storage spellcrafter:tmp wand.spells set value [14,79]
execute if score @s spellcrafter.age matches 121..160 run data modify storage spellcrafter:tmp wand.spells set value [14,14,79]
execute if score @s spellcrafter.age matches 161.. run data modify storage spellcrafter:tmp wand.spells set value [14,14,14,79]

scoreboard players set $new_cast spellcrafter.tmp 1
execute summon minecraft:marker run function spellcrafter:as_projectile/summon
scoreboard players set $new_cast spellcrafter.tmp 0
