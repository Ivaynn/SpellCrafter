
# Toggle 0/1
scoreboard players add shared_cooldowns spellcrafter.options 1
execute unless score shared_cooldowns spellcrafter.options matches 0..1 run scoreboard players set shared_cooldowns spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
