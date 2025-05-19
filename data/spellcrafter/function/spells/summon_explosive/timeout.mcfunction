#> as summon, at @s

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3 1.2
kill @s[type=!minecraft:player]
