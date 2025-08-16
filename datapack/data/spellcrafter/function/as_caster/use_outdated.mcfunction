#> as caster, at @s

function spellcrafter:as_caster/use_fail
tellraw @s ["",{text:"> ",color:"red",bold:true},{text:"This wand is from a previous version of SpellCrafter! Please use it on a Wand Editor to update it.",color:"gray"}]
