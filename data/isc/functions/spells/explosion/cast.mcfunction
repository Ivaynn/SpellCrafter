#> as projectile, on summon, at @s
# instant cast


# Damage nearby entities
execute positioned ~ ~-1 ~ as @e[distance=..5,type=!#isc:untargetable] run damage @s 16 minecraft:player_explosion by @e[limit=1,type=#isc:caster,tag=isc.caster,tag=!isc.spectator,predicate=isc:match_id]


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.2
