#> execute summon (slime) at the projectile's position
#> recursive (limited by score "$spell.summon_slime.stack spellcrafter.tmp")


# Initialize this entity
tag @s remove spellcrafter.tmp
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 600
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
data merge entity @s {Size:0,Health:4.0f,attributes:[{id:"minecraft:scale",base:2},{id:"minecraft:max_health",base:4},{id:"minecraft:movement_speed",base:0.4},{id:"minecraft:jump_strength",base:0.50}]}


# Stop here?
scoreboard players remove $spell.summon_slime.stack spellcrafter.tmp 1
execute unless score $spell.summon_slime.stack spellcrafter.tmp matches 1.. run return 0


# Add another slime to the stack
summon minecraft:slime ~ ~ ~ {Tags:["spellcrafter.summon","spellcrafter.tmp"],Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,Size:0,Health:1.0f,attributes:[{id:"minecraft:max_health",base:1.0f}]}
ride @s mount @e[limit=1,distance=..0.001,type=minecraft:slime,tag=spellcrafter.tmp]


# Recursive
execute as @e[limit=1,distance=..0.001,type=minecraft:slime,tag=spellcrafter.tmp] run function spellcrafter:spells/summon_slime/as_slime
