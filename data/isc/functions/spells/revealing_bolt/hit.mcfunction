#> as projectile, at @s
# projectile hit



# Glowing
scoreboard players operation $id isc.tmp = @s isc.id
effect give @e[distance=..10,type=!#isc:untargetable,predicate=!isc:match_id,tag=!isc.spectator] minecraft:glowing 15 0 false


# Effects
particle minecraft:glow ~ ~ ~ 3 3 3 1 50 force @a
playsound minecraft:entity.glow_squid.squirt player @a ~ ~ ~ 2 1.5
