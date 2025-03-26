#> execute summon (caster), at @s


tag @s add spellcrafter.caster
data merge entity @s {PersistenceRequired:1b, DeathLootTable:"spellcrafter:empty", equipment:{head:{id:"minecraft:stone_button",count:1}}, drop_chances:{mainhand:1000000,head:0}, attributes:[{id:"minecraft:follow_range",base:40}]}


# Get random wand
execute summon minecraft:item_display run function spellcrafter:wand_generator/as_item
item replace entity @s weapon from entity @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen] contents
kill @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen]

scoreboard players set @s spellcrafter.mana 5000
scoreboard players set @s spellcrafter.max_mana 5000
scoreboard players set @s spellcrafter.mana_reg 10
