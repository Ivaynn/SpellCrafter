#> as projectile, on summon, at @s
# instant cast


# Teleport closest target to caster
scoreboard players operation $id isc.tmp = @s isc.id


# Teleport caster to this position
execute as @e[limit=1,type=#isc:caster,tag=!isc.spectator,predicate=isc:match_id] at @e[distance=..3,limit=1,sort=nearest,type=!#isc:untargetable,tag=!isc.spectator,predicate=!isc:match_id] run function isc:spells/double_teleport/as_caster


# Success check
return 1
