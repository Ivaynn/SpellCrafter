
# Toggle 0/1/2/3
scoreboard players add trader_spawn spellcrafter.options 1
execute unless score trader_spawn spellcrafter.options matches 0..3 run scoreboard players set trader_spawn spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
