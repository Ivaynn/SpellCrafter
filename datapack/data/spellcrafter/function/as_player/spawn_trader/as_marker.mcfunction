#> execute summon (marker)

spreadplayers ~ ~ 1 32 false @s
execute if entity @s[distance=1..100] at @s run function spellcrafter:as_player/spawn_trader/success
kill @s
