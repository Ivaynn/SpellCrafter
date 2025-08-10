#> as target dummy, at @s

data merge entity @s {Invulnerable:0b, Glowing:false}

execute if predicate spellcrafter:holding_wand run return run data merge entity @s {Invulnerable:1b, Glowing:true}

execute if predicate spellcrafter:holding_dummy_remover run return run function spellcrafter:as_target_dummy/remove
