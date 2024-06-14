#> as projectile, at @s


execute at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.06 10 normal @a
playsound minecraft:entity.generic.extinguish_fire player @a ~ ~ ~ 1 1.5
function isc:as_projectile/remove
