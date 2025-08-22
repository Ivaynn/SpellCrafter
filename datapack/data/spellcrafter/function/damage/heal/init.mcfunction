#> as target (any entity)

scoreboard players operation $heal spellcrafter.tmp = @s spellcrafter.heal
scoreboard players set @s spellcrafter.heal 0

execute as @s[type=#minecraft:undead] run return run function spellcrafter:damage/heal/undead

execute if score $heal spellcrafter.tmp matches ..0 run return 0
execute if score $heal spellcrafter.tmp matches ..4 run return run effect give @s minecraft:instant_health 1 0 true
execute if score $heal spellcrafter.tmp matches ..8 run return run effect give @s minecraft:instant_health 1 1 true
execute if score $heal spellcrafter.tmp matches ..12 run return run effect give @s minecraft:instant_health 1 2 true
execute if score $heal spellcrafter.tmp matches ..16 run return run effect give @s minecraft:instant_health 1 3 true
execute if score $heal spellcrafter.tmp matches ..20 run return run effect give @s minecraft:instant_health 1 4 true
execute if score $heal spellcrafter.tmp matches ..24 run return run effect give @s minecraft:instant_health 1 5 true
execute if score $heal spellcrafter.tmp matches ..28 run return run effect give @s minecraft:instant_health 1 6 true
execute if score $heal spellcrafter.tmp matches ..32 run return run effect give @s minecraft:instant_health 1 7 true
execute if score $heal spellcrafter.tmp matches ..36 run return run effect give @s minecraft:instant_health 1 8 true
execute if score $heal spellcrafter.tmp matches ..40 run return run effect give @s minecraft:instant_health 1 9 true
execute if score $heal spellcrafter.tmp matches ..44 run return run effect give @s minecraft:instant_health 1 10 true
execute if score $heal spellcrafter.tmp matches ..48 run return run effect give @s minecraft:instant_health 1 11 true
execute if score $heal spellcrafter.tmp matches ..52 run return run effect give @s minecraft:instant_health 1 12 true
execute if score $heal spellcrafter.tmp matches ..56 run return run effect give @s minecraft:instant_health 1 13 true
execute if score $heal spellcrafter.tmp matches ..60 run return run effect give @s minecraft:instant_health 1 14 true
execute if score $heal spellcrafter.tmp matches ..64 run return run effect give @s minecraft:instant_health 1 15 true
execute if score $heal spellcrafter.tmp matches ..68 run return run effect give @s minecraft:instant_health 1 16 true
execute if score $heal spellcrafter.tmp matches ..72 run return run effect give @s minecraft:instant_health 1 17 true
execute if score $heal spellcrafter.tmp matches ..76 run return run effect give @s minecraft:instant_health 1 18 true
execute if score $heal spellcrafter.tmp matches ..80 run return run effect give @s minecraft:instant_health 1 19 true
execute if score $heal spellcrafter.tmp matches ..84 run return run effect give @s minecraft:instant_health 1 20 true
execute if score $heal spellcrafter.tmp matches ..88 run return run effect give @s minecraft:instant_health 1 21 true
execute if score $heal spellcrafter.tmp matches ..92 run return run effect give @s minecraft:instant_health 1 22 true
execute if score $heal spellcrafter.tmp matches ..96 run return run effect give @s minecraft:instant_health 1 23 true

effect give @s minecraft:instant_health 1 24 true
