#> execute summon (caster), at @s


tag @s add isc.caster
data merge entity @s {PersistenceRequired:1b, ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}], HandDropChances:[1000F,-1000F], ArmorDropChances:[-1000F,-1000F,-1000F,-1000F], Attributes:[{Name:"minecraft:generic.follow_range",Base:40}]}
loot replace entity @s weapon loot isc:wands/t1/random

scoreboard players set @s isc.mana 0
scoreboard players set @s isc.max_mana 500
