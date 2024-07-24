
summon minecraft:armor_stand ~ ~ ~ {ShowArms:1b,Tags:["isc.caster"],Invulnerable:1b,NoGravity:1b,NoBasePlate:1b}
scoreboard players set @e[type=minecraft:armor_stand,limit=1,distance=..0.01] isc.mana 1000
scoreboard players set @e[type=minecraft:armor_stand,limit=1,distance=..0.01] isc.mana_reg 10
scoreboard players set @e[type=minecraft:armor_stand,limit=1,distance=..0.01] isc.max_mana 1000
tp @e[type=minecraft:armor_stand,limit=1,distance=..0.01] @s
