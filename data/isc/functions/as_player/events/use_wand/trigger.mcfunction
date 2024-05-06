#> advancement reward
advancement revoke @s only isc:use_wand


# If player is on cooldown, stop here
execute if score @s isc.cooldown matches 1.. run return 0

# Use wand
scoreboard players operation @s isc.cooldown = cooldown isc.options
function isc:as_caster/use_wand
