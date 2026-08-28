#> as target (any entity)
# score "$id spellcrafter.tmp" must have the caster's id
# score "$damage spellcrafter.tmp" must have the damage to deal (up to 100)

execute if score $spell.safe_shot spellcrafter.tmp matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0
function spellcrafter:damage/add
