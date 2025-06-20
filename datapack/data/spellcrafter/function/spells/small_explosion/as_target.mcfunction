#> as target


execute unless score damage_caster spellcrafter.options matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0


# Max: 6
scoreboard players set $damage spellcrafter.tmp 0
execute as @s[distance=..3.5] run scoreboard players add $damage spellcrafter.tmp 1
execute as @s[distance=..3] run scoreboard players add $damage spellcrafter.tmp 1
execute as @s[distance=..2.5] run scoreboard players add $damage spellcrafter.tmp 2
execute as @s[distance=..2] run scoreboard players add $damage spellcrafter.tmp 2

function spellcrafter:damage/add
