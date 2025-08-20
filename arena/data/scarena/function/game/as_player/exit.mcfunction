#> as player

scoreboard players set @s scarena.game.id 0

clear @s

item replace entity @s hotbar.0 from entity @s enderchest.0
item replace entity @s hotbar.1 from entity @s enderchest.1
item replace entity @s hotbar.2 from entity @s enderchest.2
item replace entity @s hotbar.3 from entity @s enderchest.3
item replace entity @s hotbar.4 from entity @s enderchest.4
item replace entity @s hotbar.5 from entity @s enderchest.5
item replace entity @s hotbar.6 from entity @s enderchest.6
item replace entity @s hotbar.7 from entity @s enderchest.7
item replace entity @s hotbar.8 from entity @s enderchest.8

function scarena:as_player/state/join/lobby
tag @s remove scarena.game.dead

schedule function scarena:game/check_players 1t replace
