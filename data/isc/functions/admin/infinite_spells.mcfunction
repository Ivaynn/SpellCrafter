
# Disable
execute if score @s isc.inf_page matches 1.. run return run function isc:as_player/inf_spells/exit


# Enable
scoreboard players set @s isc.inf_page 101
function isc:as_player/inf_spells/update
return 1
