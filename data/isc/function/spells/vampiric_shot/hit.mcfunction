#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

scoreboard players set $success isc.tmp 0
execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] store result score $success isc.tmp run function isc:damage/add


# If a target is hit, heal caster
execute unless score $success isc.tmp matches 1.. run return 0
effect give @e[limit=1,type=#isc:caster,tag=isc.caster,predicate=isc:match_id,type=!#minecraft:undead,tag=!isc.spectator] minecraft:instant_health 1 0 true
effect give @e[limit=1,type=#isc:caster,tag=isc.caster,predicate=isc:match_id,type=#minecraft:undead,tag=!isc.spectator] minecraft:instant_damage 1 0 true


# Effects
playsound minecraft:entity.phantom.bite player @a ~ ~ ~ 2 0.8
