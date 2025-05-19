#> execute summon (magma_cube) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s remove spellcrafter.tmp
scoreboard players set @s spellcrafter.cooldown 10
execute if score $spell.summon_magma spellcrafter.tmp matches 1 run scoreboard players set @s spellcrafter.age 200
execute if score $spell.summon_magma spellcrafter.tmp matches 2 run scoreboard players set @s spellcrafter.age 300
execute if score $spell.summon_magma spellcrafter.tmp matches 3 run scoreboard players set @s spellcrafter.age 400
execute if score $spell.summon_magma spellcrafter.tmp matches 4 run scoreboard players set @s spellcrafter.age 500
execute if score $spell.summon_magma spellcrafter.tmp matches 5.. run scoreboard players set @s spellcrafter.age 600


# Get custom name
data modify storage spellcrafter:tmp summon.name set value []
execute summon minecraft:text_display run function spellcrafter:spells/summon_magma/as_text
data modify entity @s CustomName set from storage spellcrafter:tmp summon.name


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Scale - can't set the "Size" nbt tag because that causes slimes to create smaller slimes when they die
# 1 -> Size:0
# 2 -> Size:1
# 3 -> Size:3
# 4 -> Size:5
# 5 -> Size:7
execute if score $spell.summon_magma spellcrafter.tmp matches 1 run data merge entity @s {Size:0,Health:1.0f,attributes:[{id:"minecraft:scale",base:1},{id:"minecraft:max_health",base:1},{id:"minecraft:movement_speed",base:0.3},{id:"minecraft:jump_strength",base:0.42}]}
execute if score $spell.summon_magma spellcrafter.tmp matches 2 run data merge entity @s {Size:0,Health:4.0f,attributes:[{id:"minecraft:scale",base:2},{id:"minecraft:max_health",base:4},{id:"minecraft:movement_speed",base:0.4},{id:"minecraft:jump_strength",base:0.50}]}
execute if score $spell.summon_magma spellcrafter.tmp matches 3 run data merge entity @s {Size:0,Health:16.0f,attributes:[{id:"minecraft:scale",base:4},{id:"minecraft:max_health",base:16},{id:"minecraft:movement_speed",base:0.6},{id:"minecraft:jump_strength",base:0.65}]}
execute if score $spell.summon_magma spellcrafter.tmp matches 4 run data merge entity @s {Size:0,Health:36.0f,attributes:[{id:"minecraft:scale",base:6},{id:"minecraft:max_health",base:36},{id:"minecraft:movement_speed",base:0.8},{id:"minecraft:jump_strength",base:0.85}]}
execute if score $spell.summon_magma spellcrafter.tmp matches 5.. run data merge entity @s {Size:0,Health:64.0f,attributes:[{id:"minecraft:scale",base:8},{id:"minecraft:max_health",base:64},{id:"minecraft:movement_speed",base:1.0},{id:"minecraft:jump_strength",base:1.05}]}
