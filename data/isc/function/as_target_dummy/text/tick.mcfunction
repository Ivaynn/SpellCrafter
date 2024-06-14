#> as dummy_text


execute if score @s isc.age matches 5..60 store result entity @s text_opacity int 4.25 run scoreboard players get @s isc.age

scoreboard players remove @s isc.age 1
execute unless score @s isc.age matches 1.. run kill @s
