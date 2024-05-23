#> as projectile, on summon, at @s
# instant cast


# Teleport caster to this position
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[limit=1,type=#isc:caster,tag=isc.caster,tag=!isc.spectator,tag=!isc.untargetable,predicate=isc:match_id] positioned ^ ^ ^-0.5 align xyz run tp @s ~.5 ~ ~.5


# Effects
particle minecraft:reverse_portal ~ ~ ~ 0.3 0.3 0.3 0.5 50 force @a
playsound minecraft:entity.player.teleport player @a ~ ~ ~ 1 1
