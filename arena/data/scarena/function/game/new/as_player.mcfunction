#> as player, at @s

scoreboard players operation @s scarena.game.id = $new scarena.game.id

function scarena:as_player/state/join/game
scoreboard players set @s spellcrafter.max_mana 1000
scoreboard players set @s spellcrafter.mana_reg 10
scoreboard players set @s spellcrafter.mana 1000
scoreboard players set @s spellcrafter.cooldown 0
scoreboard players operation @s scarena.game.lives = game.lives scarena.main

item replace entity @s enderchest.0 from entity @s hotbar.0
item replace entity @s enderchest.1 from entity @s hotbar.1
item replace entity @s enderchest.2 from entity @s hotbar.2
item replace entity @s enderchest.3 from entity @s hotbar.3
item replace entity @s enderchest.4 from entity @s hotbar.4
item replace entity @s enderchest.5 from entity @s hotbar.5
item replace entity @s enderchest.6 from entity @s hotbar.6
item replace entity @s enderchest.7 from entity @s hotbar.7
item replace entity @s enderchest.8 from entity @s hotbar.8
clear @s

loot give @s loot scarena:initial_wand
