#> as summon, at @s


# Effects
particle minecraft:item{item:"minecraft:black_glazed_terracotta"} ~ ~ ~ .15 .15 .15 0.25 10 normal
playsound minecraft:block.glass.break player @a[distance=..100] ~ ~ ~ 1.0 0.65


# Remove summon
kill @s[type=!minecraft:player]
