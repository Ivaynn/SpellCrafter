
# Toggle 0/1
scoreboard players add dummy_text isc.options 1
execute unless score dummy_text isc.options matches 0..1 run scoreboard players set dummy_text isc.options 0


# Show updated menu
function isc:admin/options
