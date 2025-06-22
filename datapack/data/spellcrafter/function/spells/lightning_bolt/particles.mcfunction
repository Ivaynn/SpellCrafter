#> as projectile, at @s

execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
execute if score $tmp.boost spellcrafter.tmp matches 1 run return run particle minecraft:bubble_pop ~ ~ ~ .1 .1 .1 0.2 2 force @a[distance=..100]
particle minecraft:end_rod ~ ~ ~ .1 .1 .1 0 0 force @a[distance=..100]
