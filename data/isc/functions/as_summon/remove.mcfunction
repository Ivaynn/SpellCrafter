#> any
# remove entity with smoke particles instead of the default death animation

# Effects
execute at @s run playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1 1.5
effect give @s minecraft:invisibility infinite 0 true
execute at @s run particle minecraft:smoke ~ ~.5 ~ 0.1 0.1 0.1 0.1 10 normal @a
execute at @s run tp @s ~ -999 ~


# Remove entity
kill @s[type=!minecraft:player]
