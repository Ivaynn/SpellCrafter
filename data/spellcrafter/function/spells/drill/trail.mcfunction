#> as projectile, at @s


# Mine
execute positioned ^.2 ^.2 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^.2 ^-.2 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^-.2 ^.2 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy
execute positioned ^-.2 ^-.2 ^ if block ~ ~ ~ #minecraft:mineable/pickaxe run setblock ~ ~ ~ minecraft:air destroy


# Effects
execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
particle minecraft:enchanted_hit ~ ~ ~ .1 .1 .1 .1 1 force @a
