#> as projectile, at @s


# Mine
execute if score destructive_spells spellcrafter.options matches 1 run function spellcrafter:spells/drill/setblock


# Effects
execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
particle minecraft:enchanted_hit ~ ~ ~ .1 .1 .1 .1 1 force @a[distance=..100]
