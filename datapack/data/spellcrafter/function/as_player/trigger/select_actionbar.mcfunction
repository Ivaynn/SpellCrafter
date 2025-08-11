#> as player

scoreboard players operation @s spellcrafter.actionbar = @s SpellCrafter
scoreboard players remove @s spellcrafter.actionbar 10
execute if score @s SpellCrafter matches 10 run title @s actionbar ""

tellraw @s ["\n",{text:"SpellCrafter > ",color:"#965ed6"},{text:"Actionbar updated",color:"gray"}]
