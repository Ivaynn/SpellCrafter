#> as summon, at @s

playsound minecraft:block.glass.break player @a[distance=..100] ~ ~ ~ 1 0.9
particle minecraft:block_crumble{block_state:"minecraft:light_blue_stained_glass"} ~ ~ ~ 0.3 0.3 0.3 1 7 normal @a[distance=..100]

scoreboard players reset @s spellcrafter.age
scoreboard players reset @s spellcrafter.cooldown
kill @s[type=!minecraft:player]
