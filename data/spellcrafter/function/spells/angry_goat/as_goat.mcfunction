#> execute summon (goat) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.angry_goat
scoreboard players set @s spellcrafter.cooldown 1200
scoreboard players set @s spellcrafter.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,IsScreamingGoat:1b,HasLeftHorn:0b,HasRightHorn:0b}
effect give @s minecraft:speed infinite 0 false
effect give @s minecraft:strength infinite 1 false
effect give @s minecraft:fire_resistance infinite 2 false


# Get custom name
data modify storage spellcrafter:tmp summon.name set value []
execute summon minecraft:text_display run function spellcrafter:spells/angry_goat/as_text
data modify entity @s CustomName set from storage spellcrafter:tmp summon.name


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
