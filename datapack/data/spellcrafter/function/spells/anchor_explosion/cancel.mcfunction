#> as summon, at @s


# Effects
particle minecraft:item{item:"minecraft:respawn_anchor"} ~ ~.5 ~ .2 .2 .2 0.25 20 normal
playsound minecraft:block.respawn_anchor.deplete player @a[distance=..100] ~ ~ ~ 1.0 0.8


# Remove summon
kill @s[type=!minecraft:player]
