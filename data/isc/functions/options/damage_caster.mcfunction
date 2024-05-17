
# Toggle 0/1
scoreboard players add damage_caster isc.options 1
execute unless score damage_caster isc.options matches 0..1 run scoreboard players set damage_caster isc.options 0


# Show updated menu
function isc:admin/options
