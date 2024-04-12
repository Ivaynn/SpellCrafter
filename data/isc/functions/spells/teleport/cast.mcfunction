
particle minecraft:reverse_portal ~ ~ ~ 0.3 0.3 0.3 0.5 50 force @a

scoreboard players operation $id isc.tmp = @s isc.id
execute as @e[type=#isc:caster] if score @s isc.id = $id isc.tmp positioned ^ ^ ^-1 align xyz run tp @s ~.5 ~ ~.5

return 1
