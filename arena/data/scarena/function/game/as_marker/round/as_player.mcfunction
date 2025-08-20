#> as player, at arena center

spawnpoint @s ~ -14 ~
gamemode survival @s

tag @s add spellcrafter.caster
tag @s add spellcrafter.untargetable

effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true

scoreboard players set @s spellcrafter.cooldown 100
scoreboard players operation @s spellcrafter.mana = @s spellcrafter.max_mana
