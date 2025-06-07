#> as projectile, at @s


# Effects
execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
particle minecraft:smoke ~ ~ ~ .1 .1 .1 0 2 force @a[distance=..100]
