#> as projectile, on summon, at @s

execute at @s positioned ~ ~-1 ~ facing entity @e[limit=1,distance=0.1..30,sort=nearest,type=!#isc:untargetable,tag=!isc.spectator,tag=!isc.untargetable,predicate=!isc:match_id] feet run tp @s ~ ~1 ~ ~ ~
