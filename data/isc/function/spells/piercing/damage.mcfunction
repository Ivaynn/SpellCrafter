#> as projectile, at @s

scoreboard players operation $id isc.tmp = @s isc.id
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $blind isc.tmp = @s isc.blind


execute unless score $damage isc.tmp matches 1.. run return 0

# If target is caster, check blind time
# After blind time, hit caster anyway
# Don't add damage if target is already damaged - this fixes a bug where every step would increase the damage to the target
execute if score @s isc.blind matches 1.. positioned ~ ~-1 ~ as @e[distance=..2,type=!#isc:untargetable,predicate=!isc:match_id] unless score @s isc.damage matches 1.. run function isc:damage/add
execute unless score @s isc.blind matches 1.. positioned ~ ~-1 ~ as @e[distance=..2,type=!#isc:untargetable] unless score @s isc.damage matches 1.. run function isc:damage/add
