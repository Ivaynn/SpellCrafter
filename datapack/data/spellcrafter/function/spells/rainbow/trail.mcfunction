#> as projectile, at @s

scoreboard players operation $color spellcrafter.tmp = @s spellcrafter.dist
scoreboard players operation $color spellcrafter.tmp %= #6 spellcrafter.math

# R(100) > Y(110) > G(010) > C(011) > B(001) > M(101) > R...
execute if score $color spellcrafter.tmp matches 0 run particle minecraft:dust_color_transition{from_color:[1,0,0],scale:1,to_color:[1,1,0]} ~ ~ ~ 0 0 0 0 0 force @a
execute if score $color spellcrafter.tmp matches 1 run particle minecraft:dust_color_transition{from_color:[1,1,0],scale:1,to_color:[0,1,0]} ~ ~ ~ 0 0 0 0 0 force @a
execute if score $color spellcrafter.tmp matches 2 run particle minecraft:dust_color_transition{from_color:[0,1,0],scale:1,to_color:[0,1,1]} ~ ~ ~ 0 0 0 0 0 force @a
execute if score $color spellcrafter.tmp matches 3 run particle minecraft:dust_color_transition{from_color:[0,1,1],scale:1,to_color:[0,0,1]} ~ ~ ~ 0 0 0 0 0 force @a
execute if score $color spellcrafter.tmp matches 4 run particle minecraft:dust_color_transition{from_color:[0,0,1],scale:1,to_color:[1,0,1]} ~ ~ ~ 0 0 0 0 0 force @a
execute if score $color spellcrafter.tmp matches 5 run particle minecraft:dust_color_transition{from_color:[1,0,1],scale:1,to_color:[1,0,0]} ~ ~ ~ 0 0 0 0 0 force @a
