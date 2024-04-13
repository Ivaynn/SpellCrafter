#> as projectile, on summon, at @s
# instant cast


# Damage nearby entities
scoreboard players set $damage isc.tmp 15
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $blind isc.tmp = @s isc.blind

execute positioned ~ ~-1 ~ as @e[distance=..5,type=!#isc:untargetable] run function isc:damage/init


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.2


# Success check
return 1
