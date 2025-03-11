#> execute summon (caster), at @s


tag @s add spellcrafter.caster
data merge entity @s {PersistenceRequired:1b, ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}], HandDropChances:[1000F,-1000F], ArmorDropChances:[-1000F,-1000F,-1000F,-1000F], attributes:[{id:"minecraft:follow_range",base:40}]}
loot replace entity @s weapon loot spellcrafter:wands/t1/random

scoreboard players set @s spellcrafter.mana 0
scoreboard players set @s spellcrafter.max_mana 500
