#> execute summon (slime) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 10
scoreboard players set @s isc.age 400


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,Size:0,Health:1.0f,attributes:[{id:"minecraft:generic.max_health",base:1.0f}]}


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp
