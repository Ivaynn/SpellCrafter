#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#isc:untargetable] run function isc:damage/init


# Glowing
scoreboard players operation $id isc.tmp = @s isc.id
execute unless score damage_caster isc.options matches 1 run effect give @e[distance=..10,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:glowing 15 0 false
execute if score damage_caster isc.options matches 1 as @s[tag=!isc.spell.safe_shot] run effect give @e[distance=..10,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] minecraft:glowing 15 0 false
execute if score damage_caster isc.options matches 1 as @s[tag=isc.spell.safe_shot] run effect give @e[distance=..10,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:glowing 15 0 false


# Effects
particle minecraft:glow ~ ~ ~ 3 3 3 1 50 force @a
playsound minecraft:entity.glow_squid.squirt player @a ~ ~ ~ 2 1.5
