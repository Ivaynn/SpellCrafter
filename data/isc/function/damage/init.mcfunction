#> as target (any entity)

execute if score @s isc.damage matches 101.. run scoreboard players set @s isc.damage 100

execute if score @s isc.damage matches 1..10 run function isc:damage/d10
execute if score @s isc.damage matches 11..20 run function isc:damage/d20
execute if score @s isc.damage matches 21..30 run function isc:damage/d30
execute if score @s isc.damage matches 31..40 run function isc:damage/d40
execute if score @s isc.damage matches 41..50 run function isc:damage/d50
execute if score @s isc.damage matches 51..60 run function isc:damage/d60
execute if score @s isc.damage matches 61..70 run function isc:damage/d70
execute if score @s isc.damage matches 71..80 run function isc:damage/d80
execute if score @s isc.damage matches 81..90 run function isc:damage/d90
execute if score @s isc.damage matches 91..100 run function isc:damage/d100

scoreboard players reset @s isc.damage
