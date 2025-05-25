
# Toggle 0/1
scoreboard players add damage_caster spellcrafter.options 1
execute unless score damage_caster spellcrafter.options matches 0..1 run scoreboard players set damage_caster spellcrafter.options 0


# Show updated menu
function spellcrafter:admin/options
