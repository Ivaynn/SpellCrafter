#> [tick] as summon, at @s


particle minecraft:dust_color_transition{from_color:[0.32,0.48,0.38],scale:0.9,to_color:[0.05,0.11,0.08]} ~ ~ ~ .3 .3 .3 1 1 normal @a[distance=..100]


# Apply the effect every X ticks
scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #20 spellcrafter.math
execute unless score $rem spellcrafter.tmp matches 0 run return 0


scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id

scoreboard players set $success spellcrafter.tmp 0
execute as @e[distance=..20,type=#spellcrafter:caster,predicate=!spellcrafter:match_id,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,tag=spellcrafter.caster] run function spellcrafter:spells/ender_eye/as_target

execute if score $success spellcrafter.tmp matches 0 run data merge entity @s {item:{id:"minecraft:ender_pearl"},Glowing:0b}
execute if score $success spellcrafter.tmp matches 1 run data merge entity @s {item:{id:"minecraft:ender_eye"},Glowing:1b}
