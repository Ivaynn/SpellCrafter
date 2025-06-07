#> execute summon (block_display) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.anchor_explosion
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 100


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Update entity NBT
data merge entity @s {block_state:{Name:"minecraft:respawn_anchor", Properties:{charges:"0"}},billboard:"fixed",transformation:{translation:[-0.5f,0f,-0.5f]}}
