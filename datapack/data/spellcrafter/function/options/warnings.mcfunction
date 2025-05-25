
# Toggle 0/1
scoreboard players add warnings spellcrafter.options 1
execute unless score warnings spellcrafter.options matches 0..1 run scoreboard players set warnings spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
