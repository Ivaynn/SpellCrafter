#> execute summon (item_display) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.summon_explosive
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 60


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Update entity NBT
data merge entity @s {item:{"id":"minecraft:tnt"},billboard:"fixed",transformation:{scale:[0.85f,0.85f,0.85f]}}


scoreboard players add $spell.summon_explosive spellcrafter.tmp 3

execute store result entity @s transformation.scale[0] float 0.15 run scoreboard players get $spell.summon_explosive spellcrafter.tmp
execute store result entity @s transformation.scale[1] float 0.15 run scoreboard players get $spell.summon_explosive spellcrafter.tmp
execute store result entity @s transformation.scale[2] float 0.15 run scoreboard players get $spell.summon_explosive spellcrafter.tmp
