#> as projectile, on summon, at @s
# instant cast

scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[limit=1,sort=nearest,distance=..5,type=#isc:caster,predicate=!isc:match_id,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,tag=isc.caster,predicate=isc:holding_wand,scores={isc.cooldown=..0}] at @s run function isc:spells/forced_cast/as_target

particle minecraft:enchanted_hit ~ ~ ~ 2 2 2 0.5 50 force @a
playsound minecraft:entity.evoker.prepare_attack player @a ~ ~ ~ 2 2
