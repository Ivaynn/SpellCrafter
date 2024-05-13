#> execute summon (sheep) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 0
scoreboard players set @s isc.age 60


# Update entity NBT
data merge entity @s {Invulnerable:0b,DeathLootTable:"empty",PersistenceRequired:1b,Attributes:[{Name:"minecraft:generic.armor",Base:100},{Name:"minecraft:generic.knockback_resistance",Base:1},{Name:"minecraft:generic.movement_speed",Base:0.5}]}
damage @s 1 minecraft:player_attack by @s


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp


# Random color
execute store result entity @s Color byte 1 run random value 0..15
