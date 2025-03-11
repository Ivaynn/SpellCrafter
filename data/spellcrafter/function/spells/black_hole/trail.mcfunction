#> as projectile, at @s

execute if score @s spellcrafter.dist matches 1..25 run function spellcrafter:spells/black_hole/stage1
execute if score @s spellcrafter.dist matches 26..75 run function spellcrafter:spells/black_hole/stage2
execute if score @s spellcrafter.dist matches 76..150 run function spellcrafter:spells/black_hole/stage3
execute if score @s spellcrafter.dist matches 151..250 run function spellcrafter:spells/black_hole/stage4
execute if score @s spellcrafter.dist matches 251..375 run function spellcrafter:spells/black_hole/stage5
execute if score @s spellcrafter.dist matches 376..525 run function spellcrafter:spells/black_hole/stage6
execute if score @s spellcrafter.dist matches 526.. run function spellcrafter:spells/black_hole/stage7
effect give @e[distance=..3,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] minecraft:slow_falling 1 0 true
