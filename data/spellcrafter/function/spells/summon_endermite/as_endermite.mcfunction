#> execute summon (endermite) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.summon_endermite
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b}


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Warning
playsound minecraft:entity.endermite.ambient player @a ~ ~ ~ 1 0.7
