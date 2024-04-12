
scoreboard players operation $iter isc.tmp = @s isc.speed


# Homing & guide
scoreboard players set $homing isc.tmp 0
execute as @s[tag=isc.homing,tag=!isc.laser] at @s run function isc:spells/homing/tick
execute unless score $homing isc.tmp matches 1 as @s[tag=isc.guide,tag=!isc.laser] at @s run function isc:spells/guide/tick


# Move projectile
execute at @s run function isc:as_projectile/move


# Next projectile
execute unless score @s isc.age matches 1.. at @s run function isc:as_projectile/hit
