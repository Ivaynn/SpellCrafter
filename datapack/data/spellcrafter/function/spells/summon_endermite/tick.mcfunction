#> [tick] as endermite, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #10 spellcrafter.math

execute unless score $rem spellcrafter.tmp matches 0 run return 0

execute store result score $random spellcrafter.tmp run random value 1..10
execute unless score $random spellcrafter.tmp matches 5 run return 0


# Teleport
scoreboard players operation #id spellcrafter.tmp = @s spellcrafter.id
execute positioned ^ ^ ^5 run spreadplayers ~ ~ 1 5 false @s
execute unless entity @s[distance=..10] run return run tp @s ~ ~ ~


# Effects
execute at @s run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 0.5 1.6
