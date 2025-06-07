#> [tick] as summon, at @s

execute if score @s spellcrafter.age matches 80 run playsound minecraft:block.respawn_anchor.charge player @a[distance=..100] ~ ~ ~ 1.5 0.6
execute if score @s spellcrafter.age matches 80 run data modify entity @s block_state.Properties.charges set value "1"

execute if score @s spellcrafter.age matches 60 run playsound minecraft:block.respawn_anchor.charge player @a[distance=..100] ~ ~ ~ 1.5 0.9
execute if score @s spellcrafter.age matches 60 run data modify entity @s block_state.Properties.charges set value "2"

execute if score @s spellcrafter.age matches 40 run playsound minecraft:block.respawn_anchor.charge player @a[distance=..100] ~ ~ ~ 1.5 1.2
execute if score @s spellcrafter.age matches 40 run data modify entity @s block_state.Properties.charges set value "3"

execute if score @s spellcrafter.age matches 20 run playsound minecraft:block.respawn_anchor.charge player @a[distance=..100] ~ ~ ~ 1.5 1.5
execute if score @s spellcrafter.age matches 20 run data modify entity @s block_state.Properties.charges set value "4"
