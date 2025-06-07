#> as summon, at @s

playsound minecraft:block.glass.break player @a[distance=..100] ~ ~ ~ 1 0.65
particle minecraft:block_crumble{block_state:"minecraft:purple_stained_glass"} ~ ~ ~ 0.65 0.65 0.65 1 20 normal @a[distance=..100]

kill @s[type=!minecraft:player]
