#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/add


# Wither effect
scoreboard players operation $id isc.tmp = @s isc.id
execute unless score damage_caster isc.options matches 1 run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:wither 10 1 false
execute if score damage_caster isc.options matches 1 as @s[tag=!isc.spell.safe_shot] run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] minecraft:wither 10 1 false
execute if score damage_caster isc.options matches 1 as @s[tag=isc.spell.safe_shot] run effect give @e[distance=..3,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:wither 10 1 false


# Effects
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.5
particle minecraft:large_smoke ~ ~ ~ 0 0 0 .2 5 force @a
