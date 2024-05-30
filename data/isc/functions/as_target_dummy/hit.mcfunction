#> as target dummy, at @s


# Calculate damage taken
execute store result score $damage isc.tmp run data get entity @s Health
data modify entity @s Health set value 500f
scoreboard players remove $damage isc.tmp 500
scoreboard players operation $damage isc.tmp *= #n1 isc.math


# Text: chat
execute if score dummy_text isc.options matches 1 run tellraw @a[distance=..100] ["",{"text":"<","color":"gray"},{"selector":"@s","color":"gray"},{"text":"> ","color":"gray"},{"score":{"name":"$damage","objective":"isc.tmp"},"color":"red"}]
execute if score dummy_text isc.options matches 1 run return 0


# Text: floating
execute on attacker run scoreboard players operation $id isc.tmp = @s isc.id
summon minecraft:text_display ~ ~1 ~ {Tags:["isc.dummy_text"], text:'{"text":""}',billboard:"center",alignment:"center",background:16777215,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]}}
execute positioned ~ ~1 ~ as @e[distance=..0.001,limit=1,type=minecraft:text_display,tag=isc.dummy_text] run function isc:as_target_dummy/text/summon
