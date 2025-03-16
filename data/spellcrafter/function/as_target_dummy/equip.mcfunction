#> as target dummy, at @s

tag @s add spellcrafter.caster

data merge entity @s {Invulnerable:1b, Glowing:true}

scoreboard players set @s spellcrafter.mana 10000
scoreboard players set @s spellcrafter.max_mana 10000
scoreboard players set @s spellcrafter.mana_reg 100
scoreboard players set @s spellcrafter.cooldown 10
