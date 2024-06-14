#> execute summon (pufferfish) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 10
scoreboard players set @s isc.age 400


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,PuffState:2,Air:1000,Attributes:[{Name:"minecraft:generic.safe_fall_distance",Base:1000}]}


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp


# Effects
effect give @s minecraft:invisibility 3 0 false
playsound minecraft:entity.puffer_fish.blow_up player @a ~ ~ ~ 1 1


# Random rotation
execute store result entity @s Rotation[0] float 1 run random value -180..180
