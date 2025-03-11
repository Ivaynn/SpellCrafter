#> execute summon (bat) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 400


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b}


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
