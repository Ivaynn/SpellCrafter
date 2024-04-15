#> as projectile, on summon, at @s
# instant cast


# Damage nearby entities
execute positioned ~ ~-1 ~ as @e[distance=..5,type=!#isc:untargetable] run damage @s 16 minecraft:explosion by @s


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.2


# Success check
return 1
