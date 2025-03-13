
summon minecraft:armor_stand ~ ~ ~ {ShowArms:1b,Tags:["spellcrafter.caster"],Invulnerable:1b,NoGravity:1b,NoBasePlate:1b}
scoreboard players set @e[type=minecraft:armor_stand,limit=1,distance=..0.01] spellcrafter.mana 10000
scoreboard players set @e[type=minecraft:armor_stand,limit=1,distance=..0.01] spellcrafter.mana_reg 100
scoreboard players set @e[type=minecraft:armor_stand,limit=1,distance=..0.01] spellcrafter.max_mana 10000
tp @e[type=minecraft:armor_stand,limit=1,distance=..0.01] @s
