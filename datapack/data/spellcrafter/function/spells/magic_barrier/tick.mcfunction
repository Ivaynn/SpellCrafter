#> execute summon (item_display) at the projectile's position

execute if score @s spellcrafter.age matches 301..400 unless score @s spellcrafter.blind matches 4 run data modify entity @s item.id set value "minecraft:purple_stained_glass_pane"
execute if score @s spellcrafter.age matches 301..400 run scoreboard players set @s spellcrafter.blind 4

execute if score @s spellcrafter.age matches 201..300 unless score @s spellcrafter.blind matches 3 run data modify entity @s item.id set value "minecraft:magenta_stained_glass_pane"
execute if score @s spellcrafter.age matches 201..300 run scoreboard players set @s spellcrafter.blind 3

execute if score @s spellcrafter.age matches 101..200 unless score @s spellcrafter.blind matches 2 run data modify entity @s item.id set value "minecraft:pink_stained_glass_pane"
execute if score @s spellcrafter.age matches 101..200 run scoreboard players set @s spellcrafter.blind 2

execute if score @s spellcrafter.age matches 1..100 unless score @s spellcrafter.blind matches 1 run data modify entity @s item.id set value "minecraft:light_gray_stained_glass_pane"
execute if score @s spellcrafter.age matches 1..100 run scoreboard players set @s spellcrafter.blind 1
