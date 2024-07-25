#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

scoreboard players set $success isc.tmp 0
execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable,predicate=!isc:match_id] store result score $success isc.tmp run function isc:damage/add


# Damage caster
execute unless score $success isc.tmp matches 1.. run return 0
execute as @e[limit=1,type=#isc:caster,tag=isc.caster,predicate=isc:match_id] run function isc:damage/add


# Effects
playsound minecraft:entity.vex.charge player @a ~ ~ ~ 2 0.7
