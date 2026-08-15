#> [tick] as projectile, as @s

particle enchanted_hit ~0.5 ~ ~ 0 0.5 0.5 0 5
particle enchanted_hit ~-0.5 ~ ~ 0 0.5 0.5 0 5
particle enchanted_hit ~ ~0.5 ~ 0.5 0 0.5 0 5
particle enchanted_hit ~ ~-0.5 ~ 0.5 0 0.5 0 5
particle enchanted_hit ~ ~ ~0.5 0.5 0 0.5 0 5
particle enchanted_hit ~ ~ ~0.5 0.5 0 0.5 0 5


execute unless entity @e[dx=0,dy=0,dz=0,tag=!spellcrafter.untargetable] run return fail

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players set $damage spellcrafter.tmp 10
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,type=!#spellcrafter:untargetable] run function spellcrafter:damage/add