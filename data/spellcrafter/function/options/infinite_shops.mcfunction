
# Toggle 0/1
scoreboard players add infinite_shops spellcrafter.options 1
execute unless score infinite_shops spellcrafter.options matches 0..1 run scoreboard players set infinite_shops spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
