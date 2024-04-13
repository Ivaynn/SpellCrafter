#> as projectile, on summon, at @s
# instant cast


# Teleport caster to this position
scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[type=#isc:caster] if score @s isc.id = $id isc.tmp positioned ^ ^ ^-1 align xyz run tp @s ~.5 ~ ~.5


# Effects
particle minecraft:reverse_portal ~ ~ ~ 0.3 0.3 0.3 0.5 50 force @a
playsound minecraft:entity.player.teleport player @a ~ ~ ~ 1 1


# Success check
return 1
