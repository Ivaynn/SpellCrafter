#> execute summon (item_display) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.magic_shield
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 100


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Get caster's rotation
execute rotated as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] run tp @s ~ ~ ~ ~ ~


# Update entity NBT
data merge entity @s {item:{"id":"minecraft:light_blue_stained_glass_pane"},brightness:{sky:15,block:15},billboard:"fixed",transformation:{scale:[0.85f,0.85f,0.85f]}}
