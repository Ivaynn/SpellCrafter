#> [tick] as pig's rider

execute if score $has_rider spellcrafter.tmp matches 1 run return 0
scoreboard players set $has_rider spellcrafter.tmp 1

execute store result score $r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $mx spellcrafter.tmp run data get entity @s Motion[0] 1000
execute store result score $mz spellcrafter.tmp run data get entity @s Motion[2] 1000
