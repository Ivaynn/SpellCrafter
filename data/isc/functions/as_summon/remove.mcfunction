
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1 1.5
effect give @s minecraft:invisibility infinite 0 true
particle minecraft:smoke ~ ~.5 ~ 0.1 0.1 0.1 0.1 10 normal @a
tp @s ~ -70 ~

kill @s[type=!minecraft:player]
