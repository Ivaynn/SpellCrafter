#> execute summon, at caster
tag @s remove spellcrafter.tmp


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.mirror_image
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 300

effect give @s minecraft:invisibility 3 0 true
effect give @s minecraft:resistance infinite 100 true


# Get caster's data
data modify entity @s attributes set from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] attributes
data modify entity @s Health set from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] Health
data modify entity @s profile.id set from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] UUID
data merge entity @s {CustomNameVisible:1b,hide_description:true}
attribute @s minecraft:safe_fall_distance base set 100


# Get caster's name
data modify storage spellcrafter:tmp summon.name set value []
execute summon minecraft:text_display run function spellcrafter:spells/mirror_image/owner_name
data modify entity @s CustomName set from storage spellcrafter:tmp summon.name


# Get caster's equipment
item replace entity @s armor.head from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] armor.head
item replace entity @s armor.chest from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] armor.chest
item replace entity @s armor.legs from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] armor.legs
item replace entity @s armor.feet from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] armor.feet
item replace entity @s weapon.mainhand from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] weapon.mainhand
item replace entity @s weapon.offhand from entity @n[distance=..0.001,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] weapon.offhand


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
function spellcrafter:as_summon/check_limit/init
