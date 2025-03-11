#> execute summon (slime) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s remove spellcrafter.tmp
scoreboard players set @s spellcrafter.cooldown 10
execute if score $spell.summon_slime spellcrafter.tmp matches 1 run scoreboard players set @s spellcrafter.age 100
execute if score $spell.summon_slime spellcrafter.tmp matches 2 run scoreboard players set @s spellcrafter.age 200
execute if score $spell.summon_slime spellcrafter.tmp matches 3 run scoreboard players set @s spellcrafter.age 300
execute if score $spell.summon_slime spellcrafter.tmp matches 4 run scoreboard players set @s spellcrafter.age 400
execute if score $spell.summon_slime spellcrafter.tmp matches 5.. run scoreboard players set @s spellcrafter.age 500


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Scale - can't set the "Size" nbt tag because that causes slimes to create smaller slimes when they die
execute if score $spell.summon_slime spellcrafter.tmp matches 1 run data merge entity @s {Size:0,Health:1.0f,attributes:[{id:"minecraft:scale",base:1},{id:"minecraft:max_health",base:1}]}
execute if score $spell.summon_slime spellcrafter.tmp matches 2 run data merge entity @s {Size:0,Health:4.0f,attributes:[{id:"minecraft:scale",base:2},{id:"minecraft:max_health",base:4}]}
execute if score $spell.summon_slime spellcrafter.tmp matches 3 run data merge entity @s {Size:0,Health:16.0f,attributes:[{id:"minecraft:scale",base:4},{id:"minecraft:max_health",base:16}]}
execute if score $spell.summon_slime spellcrafter.tmp matches 4 run data merge entity @s {Size:0,Health:20.0f,attributes:[{id:"minecraft:scale",base:6},{id:"minecraft:max_health",base:20}]}
execute if score $spell.summon_slime spellcrafter.tmp matches 5.. run data merge entity @s {Size:0,Health:30.0f,attributes:[{id:"minecraft:scale",base:9},{id:"minecraft:max_health",base:30}]}
