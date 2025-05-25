#> as target, at cast position, facing @s


# Check if target is caster
execute unless score damage_caster spellcrafter.options matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0


# Check if target is facing the cast position
execute positioned as @s positioned ^ ^ ^10 rotated as @s positioned ^ ^ ^10 unless entity @s[distance=..10] run return 0


# Raycast looking for the target's face (stop on blocks)
scoreboard players set $ray spellcrafter.tmp 120
function spellcrafter:spells/flash/raycast
