#> as caster, at target


# Effects at the caster pos
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.3 0.3 0.5 50 force @a
execute at @s run playsound minecraft:entity.player.teleport player @a ~ ~ ~ 1 1


# Teleport target to caster
tp @e[distance=..0.001,limit=1,type=!#isc:untargetable,predicate=!isc:match_id,tag=!isc.spectator,tag=!isc.untargetable] @s


# Teleport caster here (target pos)
tp @s ~ ~ ~ ~ ~


# Effects at the target pos
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.3 0.3 0.5 50 force @a
playsound minecraft:entity.player.teleport player @a ~ ~ ~ 1 1
