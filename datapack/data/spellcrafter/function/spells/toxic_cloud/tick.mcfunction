#> [tick] as summon, at @s


# Effects
particle minecraft:entity_effect{color:[0.4,0.8,0.4,1.00]} ~ ~ ~ 1.3 1.3 1.3 0 5 force @a[distance=..100]


# Apply the effect
execute unless score damage_caster spellcrafter.options matches 1 run effect give @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] minecraft:poison 2 4 false
execute if score damage_caster spellcrafter.options matches 1 run effect give @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] minecraft:poison 2 4 false
