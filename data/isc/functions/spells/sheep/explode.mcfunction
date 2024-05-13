#> as sheep, on timeout, at @s
# instant cast


# Damage nearby entities
scoreboard players operation $id isc.tmp = @s isc.id
execute positioned ~ ~-1 ~ as @e[distance=..4,type=!#isc:untargetable] run damage @s 6 minecraft:player_explosion by @e[limit=1,type=#isc:caster,tag=!isc.spectator,predicate=isc:match_id]


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.4
playsound minecraft:entity.sheep.death player @a ~ ~ ~ 2 1.6
