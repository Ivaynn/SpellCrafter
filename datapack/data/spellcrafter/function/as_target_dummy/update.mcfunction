#> as target dummy, at @s


execute if predicate spellcrafter:holding_egg run return run function spellcrafter:as_target_dummy/remove
execute if data entity @s {equipment:{mainhand:{id:"minecraft:allay_spawn_egg"}}} run return run function spellcrafter:as_target_dummy/remove

execute if predicate spellcrafter:holding_wand run return run data merge entity @s {Invulnerable:1b, Glowing:true}
data merge entity @s {Invulnerable:0b, Glowing:false}
