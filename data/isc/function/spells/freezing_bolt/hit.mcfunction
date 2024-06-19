#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/add


# Slowness
scoreboard players operation $id isc.tmp = @s isc.id
execute unless score damage_caster isc.options matches 1 run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:slowness 10 2 false
execute if score damage_caster isc.options matches 1 as @s[tag=!isc.spell.safe_shot] run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] minecraft:slowness 10 2 false
execute if score damage_caster isc.options matches 1 as @s[tag=isc.spell.safe_shot] run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:slowness 10 2 false


# Effects
playsound minecraft:entity.snow_golem.death player @a ~ ~ ~ 2 0.9
particle minecraft:snowflake ~ ~ ~ .5 .5 .5 .2 25 force @a
