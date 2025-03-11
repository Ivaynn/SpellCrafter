#> new dummy_text, at @s

tag @s add spellcrafter.dummy_text


# Face the player
tp @s ~ ~ ~ facing entity @a[limit=1,distance=..100,predicate=spellcrafter:match_id] eyes


# Apply random rotation offset
execute store result score $random spellcrafter.tmp run random value -80..80
execute store result score $r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
scoreboard players operation $r0 spellcrafter.tmp += $random spellcrafter.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run random value -20..20


# Move text
execute at @s run tp @s ^ ^ ^1.5


# Text
data modify entity @s text set value '[" ",{"color":"red","score":{"name":"$damage","objective":"spellcrafter.tmp"}}," "]'


# Lifetime
scoreboard players set @s spellcrafter.age 100
