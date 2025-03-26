#> execute summon (caster), at @s


tag @s add spellcrafter.caster
data merge entity @s {PersistenceRequired:1b, equipment:{head:{id:"minecraft:stone_button",count:1}}, drop_chances:{mainhand:1000000,head:0}, attributes:[{id:"minecraft:follow_range",base:40}]}
loot replace entity @s weapon loot spellcrafter:wands/t1/random

scoreboard players set @s spellcrafter.mana 5000
scoreboard players set @s spellcrafter.max_mana 5000
scoreboard players set @s spellcrafter.mana_reg 10
