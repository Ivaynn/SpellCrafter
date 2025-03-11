#> as target


execute unless score damage_caster spellcrafter.options matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0

scoreboard players set $damage spellcrafter.tmp 8
function spellcrafter:damage/add
