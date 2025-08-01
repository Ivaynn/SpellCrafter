#> as target dummy

execute if predicate spellcrafter:holding_wand run return run data merge entity @s {Invulnerable:1b, Glowing:true}
data merge entity @s {Invulnerable:0b, Glowing:false}
