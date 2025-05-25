#> as projectile, at @s


# Mine (3x3)
execute if score destructive_spells spellcrafter.options matches 1 run function spellcrafter:spells/big_drill/setblock


# Effects
execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
particle minecraft:enchanted_hit ~ ~ ~ .3 .3 .3 .1 2 force @a
