#> as player

tellraw @s[tag=!spellcrafter.caster] ["",{text:"> ",color:"#965ed6", bold:true},{text:"Spellcasting enabled",color:"gray"}]
tellraw @s[tag=spellcrafter.caster] ["",{text:"> ",color:"#965ed6", bold:true},{text:"Spellcasting disabled",color:"gray"}]

execute as @s[tag=!spellcrafter.caster] run return run tag @s add spellcrafter.caster

tag @s remove spellcrafter.caster
execute if score @s spellcrafter.actionbar matches 1.. run title @s actionbar ""
