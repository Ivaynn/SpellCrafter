#> [tick] as caster

scoreboard players set $caster.found spellcrafter.tmp 1

execute store result score $caster.r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $caster.r1 spellcrafter.tmp run data get entity @s Rotation[1] 1
scoreboard players add $caster.r0 spellcrafter.tmp 180

execute store result score $caster.m0 spellcrafter.tmp run data get entity @s Motion[0] -200
execute store result score $caster.m1 spellcrafter.tmp run data get entity @s Motion[1] 100
execute store result score $caster.m2 spellcrafter.tmp run data get entity @s Motion[2] -200
