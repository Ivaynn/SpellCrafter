#> as target dummy, at @s


# Get health
execute store result score $damage isc.tmp run data get entity @s Health
data modify entity @s Health set value 100f


# Tellraw
scoreboard players remove $damage isc.tmp 100
tellraw @a[distance=..100] ["",{"text":"<","color":"gray"},{"selector":"@s","color":"gray"},{"text":"> ","color":"gray"},{"score":{"name":"$damage","objective":"isc.tmp"},"color":"red"}]
