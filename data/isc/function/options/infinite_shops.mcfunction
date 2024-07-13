
# Toggle 0/1
scoreboard players add infinite_shops isc.options 1
execute unless score infinite_shops isc.options matches 0..1 run scoreboard players set infinite_shops isc.options 0


# Show updated menu
function isc:admin/options
