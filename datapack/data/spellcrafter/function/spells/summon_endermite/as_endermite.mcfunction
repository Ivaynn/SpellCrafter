#> execute summon (endermite) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.summon_endermite
scoreboard players set @s spellcrafter.cooldown 10
scoreboard players set @s spellcrafter.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b}


# Get custom name
data modify storage spellcrafter:tmp summon.name set value []
execute summon minecraft:text_display run function spellcrafter:spells/summon_endermite/owner_name
data modify entity @s CustomName set from storage spellcrafter:tmp summon.name


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
function spellcrafter:as_summon/check_limit/init
