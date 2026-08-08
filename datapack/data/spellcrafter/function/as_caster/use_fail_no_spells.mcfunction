#> as caster, at @s

function spellcrafter:as_caster/use_fail
tellraw @s ["",{text:"> ",color:"red",bold:true},{text:"This wand doesn't have any spells!",color:"gray"}]
