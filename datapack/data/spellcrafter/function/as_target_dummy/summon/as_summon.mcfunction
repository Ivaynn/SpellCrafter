#> execute summon (target_dummy), at @s

tag @s add spellcrafter.target_dummy
tag @s add spellcrafter.caster

scoreboard players set @s spellcrafter.mana 10000
scoreboard players set @s spellcrafter.max_mana 10000
scoreboard players set @s spellcrafter.mana_reg 100
scoreboard players set @s spellcrafter.cooldown 10

data merge entity @s {DeathLootTable:"spellcrafter:egg/dummy",CustomName:{translate:"spellcrafter.entity.target_dummy",fallback:"Target Dummy"},PersistenceRequired:1b,NoAI:1b,Silent:1b,Health:1024.0f,DuplicationCooldown:2147483647,AbsorptionAmount:2048f,attributes:[{id:"minecraft:max_health",base:1024.0},{id:"minecraft:max_absorption",base:2048.0},{id:"minecraft:scale",base:2.0}]}
execute if data storage spellcrafter:tmp dummy.name run data modify entity @s CustomName set from storage spellcrafter:tmp dummy.name
execute at @s positioned ~ ~.42 ~ facing entity @p[distance=..10,gamemode=!spectator] eyes positioned as @s run tp @s ~ ~ ~ ~ ~

playsound minecraft:entity.allay.ambient_without_item neutral @a[distance=..100] ~ ~ ~ 1 0.8
