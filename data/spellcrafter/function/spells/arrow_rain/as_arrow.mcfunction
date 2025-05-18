#> execute summon (arrow) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.arrow_rain
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players set @s spellcrafter.age 20


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Change arrow nbt
data merge entity @s {pickup:0b, Motion:[0.0d,-2.0d,0.0d], Rotation:[0.0f,-90.0f]}
data modify entity @s Owner set from entity @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] UUID


# Get random position offset on X and Z
execute store result score $x0 spellcrafter.tmp run data get entity @s Pos[0] 10
execute store result score $z0 spellcrafter.tmp run data get entity @s Pos[2] 10

execute store result score $x1 spellcrafter.tmp run random value -35..35
execute store result score $z1 spellcrafter.tmp run random value -35..35

scoreboard players operation $x0 spellcrafter.tmp += $x1 spellcrafter.tmp
scoreboard players operation $z0 spellcrafter.tmp += $z1 spellcrafter.tmp

execute store result entity @s Pos[0] double 0.1 run scoreboard players get $x0 spellcrafter.tmp
execute store result entity @s Pos[2] double 0.1 run scoreboard players get $z0 spellcrafter.tmp
