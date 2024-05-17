
# Toggle 0/1
scoreboard players add warnings isc.options 1
execute unless score warnings isc.options matches 0..1 run scoreboard players set warnings isc.options 0


# Show updated menu
function isc:admin/options
