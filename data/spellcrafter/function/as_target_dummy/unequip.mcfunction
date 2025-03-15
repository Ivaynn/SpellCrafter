#> as target dummy, at @s

tag @s remove spellcrafter.caster
tag @s remove spellcrafter.untargetable

data merge entity @s {Invulnerable:0b, Glowing:false}

scoreboard players reset @s spellcrafter.mana
scoreboard players reset @s spellcrafter.max_mana
scoreboard players reset @s spellcrafter.mana_reg
