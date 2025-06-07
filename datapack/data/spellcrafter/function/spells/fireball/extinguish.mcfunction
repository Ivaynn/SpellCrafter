#> as projectile, at @s


execute at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.06 10 normal @a[distance=..100]
playsound minecraft:entity.generic.extinguish_fire player @a[distance=..100] ~ ~ ~ 1 1.5
function spellcrafter:as_projectile/remove
