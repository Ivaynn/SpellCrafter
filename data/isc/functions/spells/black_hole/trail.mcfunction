#> as projectile, at @s

execute if score @s isc.dist matches 1..25 run function isc:spells/black_hole/stage1
execute if score @s isc.dist matches 26..75 run function isc:spells/black_hole/stage2
execute if score @s isc.dist matches 76..150 run function isc:spells/black_hole/stage3
execute if score @s isc.dist matches 151..250 run function isc:spells/black_hole/stage4
execute if score @s isc.dist matches 251..375 run function isc:spells/black_hole/stage5
execute if score @s isc.dist matches 376..525 run function isc:spells/black_hole/stage6
execute if score @s isc.dist matches 526.. run function isc:spells/black_hole/stage7
