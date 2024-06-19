#> scheduled

execute as @e[type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] if score @s isc.damage matches 1.. run function isc:damage/init
