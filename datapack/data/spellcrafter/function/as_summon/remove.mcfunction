#> any
# remove entity with smoke particles instead of the default death animation


# Dismount any passengers
execute on passengers run ride @s dismount


# Effects
execute at @s run playsound minecraft:block.fire.extinguish player @a[distance=..20] ~ ~ ~ 0.7 1.5
effect give @s minecraft:invisibility infinite 0 true
execute at @s run particle minecraft:smoke ~ ~.5 ~ 0.1 0.1 0.1 0.1 10 normal @a[distance=..20]
execute at @s run tp @s ~ -999 ~


# Remove entity
data remove entity @s CustomName
kill @s[type=!minecraft:player]
