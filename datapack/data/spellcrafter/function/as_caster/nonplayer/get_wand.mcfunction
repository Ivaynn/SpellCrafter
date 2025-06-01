#> as non-player caster, at @s


# Get tier from entity type
function spellcrafter:as_caster/nonplayer/get_tier
execute unless score $gen.tier spellcrafter.tmp matches 1..5 run return run tag @s remove spellcrafter.caster


# Get random wand
execute summon minecraft:item_display run function spellcrafter:wand_generator/as_item
item replace entity @s weapon from entity @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen] contents
kill @e[limit=1,distance=..0.001,type=minecraft:item_display,tag=spellcrafter.gen]
data modify entity @s drop_chances.mainhand set value 1000000
