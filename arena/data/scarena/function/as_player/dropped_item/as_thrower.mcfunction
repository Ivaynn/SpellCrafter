#> as player

scoreboard players set $item.found_owner scarena.tmp 1
execute if score @s spellcrafter.inf_page matches 1.. run scoreboard players set $item.inf_spells scarena.tmp 1
execute if score @s scarena.player.state matches 3.. run scoreboard players set $item.on_arena scarena.tmp 1
