#> as target


execute unless score damage_caster spellcrafter.options matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0

# Max: 20
scoreboard players set $damage spellcrafter.tmp 0
execute as @s[distance=..7] run scoreboard players add $damage spellcrafter.tmp 2
execute as @s[distance=..6] run scoreboard players add $damage spellcrafter.tmp 3
execute as @s[distance=..5] run scoreboard players add $damage spellcrafter.tmp 4
execute as @s[distance=..4] run scoreboard players add $damage spellcrafter.tmp 5
execute as @s[distance=..3] run scoreboard players add $damage spellcrafter.tmp 6

function spellcrafter:damage/add
