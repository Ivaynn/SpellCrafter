#> execute summon (vex) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.summon_vex
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,equipment:{mainhand:{id:"minecraft:iron_sword",count:1}},drop_chances:{mainhand:0}}
execute store result score $random spellcrafter.tmp run random value 1..100
execute if score $random spellcrafter.tmp matches 1..15 run data modify entity @s equipment.mainhand.id set value "minecraft:iron_hoe"
execute if score $random spellcrafter.tmp matches 16..30 run data modify entity @s equipment.mainhand.id set value "minecraft:iron_shovel"
execute if score $random spellcrafter.tmp matches 31..45 run data modify entity @s equipment.mainhand.id set value "minecraft:iron_pickaxe"
execute if score $random spellcrafter.tmp matches 46..60 run data modify entity @s equipment.mainhand.id set value "minecraft:iron_axe"
execute if score $random spellcrafter.tmp matches 61..75 run data modify entity @s equipment.mainhand.id set value "minecraft:iron_sword"

execute if score $random spellcrafter.tmp matches 76..80 run data modify entity @s equipment.mainhand.id set value "minecraft:diamond_hoe"
execute if score $random spellcrafter.tmp matches 81..85 run data modify entity @s equipment.mainhand.id set value "minecraft:diamond_shovel"
execute if score $random spellcrafter.tmp matches 86..90 run data modify entity @s equipment.mainhand.id set value "minecraft:diamond_pickaxe"
execute if score $random spellcrafter.tmp matches 91..95 run data modify entity @s equipment.mainhand.id set value "minecraft:diamond_axe"
execute if score $random spellcrafter.tmp matches 96..99 run data modify entity @s equipment.mainhand.id set value "minecraft:diamond_sword"

execute if score $random spellcrafter.tmp matches 100 run data modify entity @s equipment.mainhand.id set value "minecraft:netherite_sword"


# Get custom name
data modify storage spellcrafter:tmp summon.name set value []
execute summon minecraft:text_display run function spellcrafter:spells/summon_vex/owner_name
data modify entity @s CustomName set from storage spellcrafter:tmp summon.name


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
