
# Toggle 0/1/2
scoreboard players add dummy_text spellcrafter.options 1
execute unless score dummy_text spellcrafter.options matches 0..2 run scoreboard players set dummy_text spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
