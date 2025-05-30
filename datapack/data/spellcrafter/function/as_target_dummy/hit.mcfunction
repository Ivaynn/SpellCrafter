#> as target dummy, at @s


# Fix double message if spells deal damage in 2 consecutive ticks
execute if score @s spellcrafter.damage matches 1.. run return 0


# Calculate damage taken
execute store result score $damage spellcrafter.tmp run data get entity @s AbsorptionAmount
data merge entity @s {AbsorptionAmount:2048.0f, Health:1024.0f, attributes:[{id:"minecraft:max_health",base:1024.0},{id:"minecraft:max_absorption",base:2048.0}]}
scoreboard players remove $damage spellcrafter.tmp 2048
scoreboard players operation $damage spellcrafter.tmp *= #n1 spellcrafter.math


# Text: none
execute if score dummy_text spellcrafter.options matches 2 run return 0


# Text: chat
execute if score dummy_text spellcrafter.options matches 1 run return run tellraw @a[distance=..50] ["<",{selector:"@s"},"> ",{text:"-",color:"red"},{score:{name:"$damage",objective:"spellcrafter.tmp"},color:"red"}]


# Text: floating
execute on attacker run scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
summon minecraft:text_display ~ ~ ~ {Tags:["spellcrafter.dummy_text"], text:{text:""},billboard:"center",alignment:"center",background:16777215,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]}}
execute positioned ~ ~ ~ as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=spellcrafter.dummy_text] run function spellcrafter:as_target_dummy/text/summon
