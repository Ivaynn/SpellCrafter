# Executed by the new vex

tag @s add isc.summon
scoreboard players set @s isc.cooldown 10
scoreboard players set @s isc.age 600

data merge entity @s {Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,HandItems:[{id:"minecraft:iron_sword",Count:1b},{}],HandDropChances:[-99999.000F,0.085F]}
