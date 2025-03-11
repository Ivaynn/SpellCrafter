#> execute summon (wind_charge) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add spellcrafter.summon
scoreboard players set @s spellcrafter.cooldown 1
scoreboard players set @s spellcrafter.age 60


# Get caster's id
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp


# Shoot with player's facing direction
execute store result score $x0 spellcrafter.tmp run data get entity @s Pos[0] 10
execute store result score $y0 spellcrafter.tmp run data get entity @s Pos[1] 10
execute store result score $z0 spellcrafter.tmp run data get entity @s Pos[2] 10

execute rotated as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] run tp @s ^ ^ ^1

execute store result score $x1 spellcrafter.tmp run data get entity @s Pos[0] 10
execute store result score $y1 spellcrafter.tmp run data get entity @s Pos[1] 10
execute store result score $z1 spellcrafter.tmp run data get entity @s Pos[2] 10

scoreboard players operation $x1 spellcrafter.tmp -= $x0 spellcrafter.tmp
scoreboard players operation $y1 spellcrafter.tmp -= $y0 spellcrafter.tmp
scoreboard players operation $z1 spellcrafter.tmp -= $z0 spellcrafter.tmp

execute store result score $x0 spellcrafter.tmp run random value -1..1
execute store result score $y0 spellcrafter.tmp run random value -1..1
execute store result score $z0 spellcrafter.tmp run random value -1..1

scoreboard players operation $x1 spellcrafter.tmp -= $x0 spellcrafter.tmp
scoreboard players operation $y1 spellcrafter.tmp -= $y0 spellcrafter.tmp
scoreboard players operation $z1 spellcrafter.tmp -= $z0 spellcrafter.tmp

execute store result entity @s Motion[0] double 0.2 run scoreboard players get $x1 spellcrafter.tmp
execute store result entity @s Motion[1] double 0.2 run scoreboard players get $y1 spellcrafter.tmp
execute store result entity @s Motion[2] double 0.2 run scoreboard players get $z1 spellcrafter.tmp
