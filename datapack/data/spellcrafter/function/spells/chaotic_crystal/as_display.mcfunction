#> execute summon (item_display) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.chaotic_crystal
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 60
scoreboard players operation @s spellcrafter.age *= $spell.chaotic_crystal spellcrafter.tmp


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Update entity NBT
data merge entity @s {item:{"id":"minecraft:black_glazed_terracotta"},billboard:"fixed",transformation:{scale:[0.6f,0.6f,0.6f],right_rotation:[0.73,1,0,1]}}
