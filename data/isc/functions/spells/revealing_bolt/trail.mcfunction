#> as projectile, at @s


# Glowing
scoreboard players operation $id isc.tmp = @s isc.id
effect give @e[distance=..5,type=!#isc:untargetable,predicate=!isc:match_id,tag=!isc.spectator,tag=!isc.untargetable] minecraft:glowing 5 0 false


# Effects
execute as @s[tag=isc.spell.hidden] run return 0
execute as @s[tag=isc.spell.rainbow] run return run function isc:spells/rainbow/trail
particle minecraft:glow ~ ~ ~ 0 0 0 0 0 force @a
