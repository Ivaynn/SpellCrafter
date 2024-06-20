#> as projectile, at @s


# Effects
execute as @s[tag=isc.spell.hidden] run return 0
execute as @s[tag=isc.spell.rainbow] run return run function isc:spells/rainbow/trail
particle minecraft:smoke ~ ~ ~ .1 .1 .1 0 2 force @a
