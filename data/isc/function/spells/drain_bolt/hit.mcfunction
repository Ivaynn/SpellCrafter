#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

scoreboard players set $success isc.tmp 0
execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/add
execute positioned ~ ~-1 ~ as @e[distance=..3,limit=1,sort=nearest,type=#isc:caster,type=!#isc:untargetable,tag=isc.caster,tag=!isc.untargetable] run function isc:spells/drain_bolt/as_target


# Effects
execute if score $success isc.tmp matches 1.. run playsound minecraft:entity.allay.item_thrown player @a ~ ~ ~ 2 0.9
