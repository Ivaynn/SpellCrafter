#> as player, at @s

scoreboard players set @s stats -1
scoreboard players add $new scarena.player.id 1
scoreboard players operation @s scarena.player.id = $new scarena.player.id

execute unless items entity @s hotbar.4 * run loot replace entity @s hotbar.4 loot spellcrafter:wand

function scarena:as_player/state/join/room
