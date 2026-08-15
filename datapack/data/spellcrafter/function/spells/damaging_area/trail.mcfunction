#> [tick] as projectile, at @s

particle minecraft:enchanted_hit ~ ~ ~ 1.1 1.1 1.1 0.5 1 force @a
particle minecraft:enchanted_hit ~ ~ ~ 1.1 1.1 1.1 0.5 5 normal @a

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players set $damage spellcrafter.tmp 8
execute positioned ~ ~-0.75 ~ as @e[distance=..3,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] unless score @s spellcrafter.damage matches 1.. run function spellcrafter:damage/add
