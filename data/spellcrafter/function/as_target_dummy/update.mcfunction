#> as target dummy

execute if predicate spellcrafter:holding_wand run data merge entity @s {Invulnerable:1b, Glowing:true}
execute unless predicate spellcrafter:holding_wand run data merge entity @s {Invulnerable:0b, Glowing:false}
