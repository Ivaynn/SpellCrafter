#> execute summon (wind_charge) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 1
scoreboard players set @s isc.age 60


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp


# Shoot with player's facing direction
execute store result score $x0 isc.tmp run data get entity @s Pos[0] 10
execute store result score $y0 isc.tmp run data get entity @s Pos[1] 10
execute store result score $z0 isc.tmp run data get entity @s Pos[2] 10

execute rotated as @e[limit=1,type=#isc:caster,tag=isc.caster,predicate=isc:match_id] run tp @s ^ ^ ^1

execute store result score $x1 isc.tmp run data get entity @s Pos[0] 10
execute store result score $y1 isc.tmp run data get entity @s Pos[1] 10
execute store result score $z1 isc.tmp run data get entity @s Pos[2] 10

scoreboard players operation $x1 isc.tmp -= $x0 isc.tmp
scoreboard players operation $y1 isc.tmp -= $y0 isc.tmp
scoreboard players operation $z1 isc.tmp -= $z0 isc.tmp

execute store result score $x0 isc.tmp run random value -1..1
execute store result score $y0 isc.tmp run random value -1..1
execute store result score $z0 isc.tmp run random value -1..1

scoreboard players operation $x1 isc.tmp -= $x0 isc.tmp
scoreboard players operation $y1 isc.tmp -= $y0 isc.tmp
scoreboard players operation $z1 isc.tmp -= $z0 isc.tmp

execute store result entity @s Motion[0] double 0.2 run scoreboard players get $x1 isc.tmp
execute store result entity @s Motion[1] double 0.2 run scoreboard players get $y1 isc.tmp
execute store result entity @s Motion[2] double 0.2 run scoreboard players get $z1 isc.tmp
