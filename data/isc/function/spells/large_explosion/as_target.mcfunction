#> as target


execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0

# Max: 20
scoreboard players set $damage isc.tmp 0
execute as @s[distance=..7] run scoreboard players add $damage isc.tmp 2
execute as @s[distance=..6] run scoreboard players add $damage isc.tmp 3
execute as @s[distance=..5] run scoreboard players add $damage isc.tmp 4
execute as @s[distance=..4] run scoreboard players add $damage isc.tmp 5
execute as @s[distance=..3] run scoreboard players add $damage isc.tmp 6

function isc:damage/add
