#> as target, at @s

execute as @s[type=minecraft:player] run function isc:as_caster/player/use_wand
execute as @s[type=!minecraft:player] run function isc:as_caster/nonplayer/use_wand
