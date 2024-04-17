#> as projectile, on summon, at @s
# instant cast


# Remove projectiles
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[distance=..15,type=minecraft:marker,tag=isc.projectile,predicate=!isc:match_id] at @s run function isc:as_projectile/remove


# Effects
particle minecraft:large_smoke ~ ~ ~ 3 3 3 0.6 50 force @a
playsound minecraft:entity.illusioner.prepare_mirror master @a ~ ~ ~ 2 1.2


# Success check
return 1
