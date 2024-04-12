
scoreboard players operation $iter isc.tmp = @s isc.speed



execute as @s[tag=isc.homing,tag=!isc.laser] at @s run function isc:spells/homing/tick


execute at @s run function isc:as_projectile/move


# Next projectile
execute unless score @s isc.age matches 1.. at @s run function isc:as_projectile/hit
