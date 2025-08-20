#> as player, at arena center

tag @s remove spellcrafter.untargetable
gamemode survival @s
spawnpoint @s ~ -14 ~

effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true

scoreboard players operation @s spellcrafter.mana = @s spellcrafter.max_mana
scoreboard players set @s spellcrafter.cooldown 0
