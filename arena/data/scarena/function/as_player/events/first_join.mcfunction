#> as player, at @s

scoreboard players set @s stats -1
scoreboard players add $new scarena.player.id 1
scoreboard players operation @s scarena.player.id = $new scarena.player.id

execute unless items entity @s hotbar.0 * run loot replace entity @s hotbar.0 loot spellcrafter:wand

function scarena:as_player/state/join/room
function scarena:as_player/stats/save/init
