#> execute summon (item_display) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.ender_eye
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 200


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
function spellcrafter:as_summon/check_limit/init


# Update entity NBT
data merge entity @s {item:{id:"minecraft:ender_pearl"},Glowing:0b,billboard:"center",transformation:{scale:[1.5f,1.5f,1.5f]}}
