#> execute summon (pig) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 2147483647
scoreboard players set @s isc.age 100


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,Saddle:1b}


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp
