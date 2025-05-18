#> execute summon (vex) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.summon_vex
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,equipment:{mainhand:{id:"minecraft:iron_sword",count:1}},drop_chances:{mainhand:0}}


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
