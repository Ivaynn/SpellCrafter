#> as projectile, at @s


# Mine (3x3)
execute positioned ^ ^ ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy

execute positioned ^.8 ^ ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^-.8 ^ ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^ ^.8 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^ ^-.8 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy

execute positioned ^.8 ^.8 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^.8 ^-.8 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^-.8 ^.8 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^-.8 ^-.8 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy


# Effects
execute as @s[tag=isc.spell.hidden] run return 0
execute as @s[tag=isc.spell.rainbow] run return run function isc:spells/rainbow/trail
particle minecraft:enchanted_hit ~ ~ ~ .3 .3 .3 .1 2 force @a
