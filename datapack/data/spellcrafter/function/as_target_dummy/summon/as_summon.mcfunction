#> execute summon (target_dummy), at @s

tag @s add spellcrafter.target_dummy
tag @s add spellcrafter.caster

scoreboard players set @s spellcrafter.mana 10000
scoreboard players set @s spellcrafter.max_mana 10000
scoreboard players set @s spellcrafter.mana_reg 100
scoreboard players set @s spellcrafter.cooldown 10

data merge entity @s {DeathLootTable:"spellcrafter:egg/dummy",CustomName:{translate:"spellcrafter.entity.target_dummy",fallback:"Target Dummy",color:"aqua"},CustomNameVisible:0b,PersistenceRequired:1b,NoAI:1b,Silent:1b,Health:1024.0f,DuplicationCooldown:2147483647,AbsorptionAmount:2048f,attributes:[{id:"minecraft:max_health",base:1024.0},{id:"minecraft:max_absorption",base:2048.0},{id:"minecraft:scale",base:2.0}]}
execute positioned ~ ~-1.2 ~ rotated as @p[distance=..0.001] run tp @s ~ ~1.2 ~ ~ 0
