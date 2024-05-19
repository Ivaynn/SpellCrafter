#> as target dummy, at @s

effect give @s minecraft:invisibility infinite 0 true
execute at @s run tp @s ~ -999 ~
kill @s[type=!minecraft:player]
