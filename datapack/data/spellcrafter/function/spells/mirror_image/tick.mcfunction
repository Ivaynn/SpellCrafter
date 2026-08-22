#> [tick] as summon, at @s


# Stealth hat
scoreboard players set $caster.hat spellcrafter.tmp 0
execute store result score $caster.hat spellcrafter.tmp run data get entity @s equipment.head.components."minecraft:custom_data".spellcrafter.hat.type
execute if score $caster.hat spellcrafter.tmp matches 8 run effect give @s minecraft:invisibility 1 0 true


# Find owner
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id

scoreboard players set $caster.found spellcrafter.tmp 0
execute as @n[distance=..15,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id,tag=!spellcrafter.spectator] run function spellcrafter:spells/mirror_image/tick_as_caster
execute if score $caster.found spellcrafter.tmp matches 0 run return 0


# Copy owner's movements
execute store result entity @s Rotation[0] float 1 run scoreboard players get $caster.r0 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $caster.r1 spellcrafter.tmp

execute store result entity @s Motion[0] double 0.002 run scoreboard players get $caster.m0 spellcrafter.tmp
execute if score $caster.m1 spellcrafter.tmp matches 1.. store result entity @s Motion[1] double 0.001 run scoreboard players get $caster.m1 spellcrafter.tmp
execute store result entity @s Motion[2] double 0.002 run scoreboard players get $caster.m2 spellcrafter.tmp
