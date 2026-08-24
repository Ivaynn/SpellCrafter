#> as projectile, on summon, at @s

execute at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.06 10 normal @a[distance=..100]
playsound minecraft:entity.breeze.deflect player @a[distance=..100] ~ ~ ~ 1 0.8
function spellcrafter:as_projectile/remove
