#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.2


# Damage nearby entities
execute positioned ~ ~-1 ~ as @e[distance=..5,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] run function isc:spells/explosion/as_target
