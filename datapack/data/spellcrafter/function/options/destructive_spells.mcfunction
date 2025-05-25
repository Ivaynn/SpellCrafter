
# Toggle 0/1
scoreboard players add destructive_spells spellcrafter.options 1
execute unless score destructive_spells spellcrafter.options matches 0..1 run scoreboard players set destructive_spells spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
