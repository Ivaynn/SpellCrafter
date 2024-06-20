#> as target


execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0


# Max: 10
scoreboard players set $damage isc.tmp 0
execute as @s[distance=..6] run scoreboard players add $damage isc.tmp 1
execute as @s[distance=..5] run scoreboard players add $damage isc.tmp 2
execute as @s[distance=..4] run scoreboard players add $damage isc.tmp 3
execute as @s[distance=..3] run scoreboard players add $damage isc.tmp 4

function isc:damage/add
