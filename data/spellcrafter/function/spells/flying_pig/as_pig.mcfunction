#> execute summon (pig) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
scoreboard players set @s spellcrafter.cooldown 2147483647
scoreboard players set @s spellcrafter.age 100


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,Saddle:1b,AbsorptionAmount:2048f,attributes:[{id:"minecraft:armor",base:30},{id:"minecraft:max_absorption",base:2048},{id:"minecraft:movement_speed",base:-100}]}


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
