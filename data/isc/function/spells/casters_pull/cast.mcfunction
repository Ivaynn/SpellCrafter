#> as projectile, on summon, at @s

execute at @s positioned ~ ~-1 ~ facing entity @e[limit=1,distance=..100,sort=nearest,type=#isc:caster,tag=isc.caster,tag=!isc.spectator,predicate=isc:match_id] feet run tp @s ~ ~1 ~ ~ ~
