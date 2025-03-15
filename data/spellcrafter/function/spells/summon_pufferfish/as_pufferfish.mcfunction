#> execute summon (pufferfish) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 400


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,PuffState:2,Air:1000,attributes:[{id:"minecraft:safe_fall_distance",base:1000}]}


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Effects
effect give @s minecraft:invisibility 3 0 false
playsound minecraft:entity.puffer_fish.blow_up player @a ~ ~ ~ 1 1


# Random rotation
execute store result entity @s Rotation[0] float 1 run random value -180..180
