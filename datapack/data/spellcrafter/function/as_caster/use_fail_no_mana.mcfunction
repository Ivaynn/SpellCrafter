#> as caster, at @s

function spellcrafter:as_caster/use_fail
execute if score @s spellcrafter.max_mana < $mana spellcrafter.tmp run tellraw @s ["",{text:"> ",color:"red",bold:true},{text:"You don't have enough mana to use this wand!",color:"gray"}]
