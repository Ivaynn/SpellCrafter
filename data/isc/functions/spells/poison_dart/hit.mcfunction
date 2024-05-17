#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind

execute if score $damage isc.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,limit=1,sort=nearest,type=!#isc:untargetable] run function isc:damage/init


# Glowing
scoreboard players operation $id isc.tmp = @s isc.id
execute unless score damage_caster isc.options matches 1 run effect give @e[distance=..3,limit=1,sort=nearest,type=!#isc:untargetable,predicate=!isc:match_id,tag=!isc.spectator] minecraft:poison 5 0 false
execute if score damage_caster isc.options matches 1 run effect give @e[distance=..3,limit=1,sort=nearest,type=!#isc:untargetable,tag=!isc.spectator] minecraft:poison 5 0 false


# Effects
playsound minecraft:entity.slime.squish_small player @a ~ ~ ~ 1 1.2
