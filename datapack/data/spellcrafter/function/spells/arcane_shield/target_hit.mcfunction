#> as projectile, at target projectile (to be removed)

execute if score $hit_shield spellcrafter.tmp matches 1 run return 0
scoreboard players set $hit_shield spellcrafter.tmp 1

scoreboard players operation @s spellcrafter.age -= $shield_damage spellcrafter.tmp
execute if score @s spellcrafter.age matches 2.. run playsound minecraft:entity.iron_golem.damage player @a ~ ~ ~ 1 1.4
