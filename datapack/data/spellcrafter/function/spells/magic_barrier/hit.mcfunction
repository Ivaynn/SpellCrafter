#> as summon, at target projectile (to be removed)

execute if score $hit_shield spellcrafter.tmp matches 1 run return 0
scoreboard players set $hit_shield spellcrafter.tmp 1

scoreboard players operation @s spellcrafter.age -= $shield_damage spellcrafter.tmp
execute at @s if score @s spellcrafter.age matches 5.. run playsound minecraft:block.glass.break player @a[distance=..100] ~ ~ ~ 1 1.8
