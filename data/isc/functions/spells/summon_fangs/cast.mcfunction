#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute at @e[distance=..5,sort=nearest,type=!#isc:untargetable,predicate=!isc:match_id,tag=!isc.spectator,tag=!isc.untargetable] run summon minecraft:evoker_fangs ~ ~ ~ {Tags:["isc.summon"]}
