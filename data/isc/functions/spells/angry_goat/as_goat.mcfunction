#> execute summon (goat) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 1200
scoreboard players set @s isc.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,IsScreamingGoat:1b,HasLeftHorn:1b,HasRightHorn:1b}
effect give @s minecraft:speed infinite 0 false
effect give @s minecraft:strength infinite 1 false
effect give @s minecraft:fire_resistance infinite 2 false


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp
