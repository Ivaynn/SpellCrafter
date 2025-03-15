#> as target dummy, at @s


# Calculate damage taken
execute store result score $damage spellcrafter.tmp run data get entity @s Health
data modify entity @s Health set value 1024.0f
scoreboard players remove $damage spellcrafter.tmp 1024
scoreboard players operation $damage spellcrafter.tmp *= #n1 spellcrafter.math


# Text: chat
execute if score dummy_text spellcrafter.options matches 1 run return run tellraw @a[distance=..100] ["",{"text":"<Target Dummy> ","color":"gray"},{"score":{"name":"$damage","objective":"spellcrafter.tmp"},"color":"red"}]


# Text: floating
execute on attacker run scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
summon minecraft:text_display ~ ~ ~ {Tags:["spellcrafter.dummy_text"], text:'{"text":""}',billboard:"center",alignment:"center",background:16777215,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]}}
execute positioned ~ ~ ~ as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=spellcrafter.dummy_text] run function spellcrafter:as_target_dummy/text/summon
