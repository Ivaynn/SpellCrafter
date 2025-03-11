#> as target dummy, at @s


# Calculate damage taken
execute store result score $damage spellcrafter.tmp run data get entity @s Health
data modify entity @s Health set value 500f
scoreboard players remove $damage spellcrafter.tmp 500
scoreboard players operation $damage spellcrafter.tmp *= #n1 spellcrafter.math


# Text: chat
execute if score dummy_text spellcrafter.options matches 1 run tellraw @a[distance=..100] ["",{"text":"<","color":"gray"},{"selector":"@s","color":"gray"},{"text":"> ","color":"gray"},{"score":{"name":"$damage","objective":"spellcrafter.tmp"},"color":"red"}]
execute if score dummy_text spellcrafter.options matches 1 run return 0


# Text: floating
execute on attacker run scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
summon minecraft:text_display ~ ~1 ~ {Tags:["spellcrafter.dummy_text"], text:'{"text":""}',billboard:"center",alignment:"center",background:16777215,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]}}
execute positioned ~ ~1 ~ as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=spellcrafter.dummy_text] run function spellcrafter:as_target_dummy/text/summon
