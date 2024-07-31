#> as projectile, on summon, at @s

scoreboard players operation @s isc.id = @e[limit=1,distance=0.1..100,sort=nearest,type=#isc:caster,tag=isc.caster,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] isc.id
scoreboard players operation $id isc.tmp = @s isc.id
