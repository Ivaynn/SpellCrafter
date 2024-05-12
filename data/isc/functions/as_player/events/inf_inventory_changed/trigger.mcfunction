#> advancement reward
advancement revoke @s only isc:inf_inventory_changed


# Schedule inventory update for this tick (advancement rewards trigger out of normal tick, which causes issues)
execute if score @s isc.inf_page matches 1.. run scoreboard players add @s isc.inf_page 100
