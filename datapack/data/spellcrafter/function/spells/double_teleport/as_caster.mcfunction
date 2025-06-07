#> as caster, at target


# Effects at the caster pos
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.3 0.3 0.5 50 force @a[distance=..100]
execute at @s run playsound minecraft:entity.player.teleport player @a[distance=..100] ~ ~ ~ 1 1


# Teleport target to caster
tp @e[distance=..0.001,limit=1,type=!#spellcrafter:untargetable,predicate=!spellcrafter:match_id,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] @s


# Teleport caster here (target pos)
tp @s ~ ~ ~ ~ ~


# Effects at the target pos
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.3 0.3 0.5 50 force @a[distance=..100]
playsound minecraft:entity.player.teleport player @a[distance=..100] ~ ~ ~ 1 1
