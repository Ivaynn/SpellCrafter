#> as dummy_text


execute if score @s spellcrafter.age matches 5..60 store result entity @s text_opacity int 4.25 run scoreboard players get @s spellcrafter.age

scoreboard players remove @s spellcrafter.age 1
execute unless score @s spellcrafter.age matches 1.. run kill @s
