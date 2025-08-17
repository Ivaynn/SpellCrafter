#> advancement reward
advancement revoke @s only scarena:inventory_changed

execute if score @s scarena.player.state matches 1..3 unless score @s spellcrafter.inf_page matches 1.. run function scarena:as_player/events/inventory_changed/clear
