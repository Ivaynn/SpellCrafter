#> advancement reward
advancement revoke @s only isc:use_wand


# If player is not a caster, stop here
execute as @s[tag=!isc.caster] run return 0


# If player is on cooldown, stop here
execute if score @s isc.cooldown matches 1.. run return 0


# Use wand
function isc:as_caster/player/use_wand
