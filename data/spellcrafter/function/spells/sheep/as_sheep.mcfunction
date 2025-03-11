#> execute summon (sheep) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 60


# Update entity NBT
data merge entity @s {Invulnerable:0b,DeathLootTable:"",PersistenceRequired:1b,attributes:[{id:"minecraft:armor",base:30},{id:"minecraft:knockback_resistance",base:1},{id:"minecraft:movement_speed",base:0.5}]}
damage @s 1 minecraft:player_attack by @s


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Random color
execute store result entity @s Color byte 1 run random value 0..15
