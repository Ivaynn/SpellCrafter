#> new dummy_text, at @s

tag @s add isc.dummy_text


# Face the player
tp @s ~ ~ ~ facing entity @a[limit=1,distance=..100,predicate=isc:match_id] eyes


# Apply random rotation offset
execute store result score $random isc.tmp run random value -80..80
execute store result score $r0 isc.tmp run data get entity @s Rotation[0] 1
scoreboard players operation $r0 isc.tmp += $random isc.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 isc.tmp
execute store result entity @s Rotation[1] float 1 run random value -20..20


# Move text
execute at @s run tp @s ^ ^ ^1.5


# Text
data modify entity @s text set value '[" ",{"color":"red","score":{"name":"$damage","objective":"isc.tmp"}}," "]'


# Lifetime
scoreboard players set @s isc.age 60
