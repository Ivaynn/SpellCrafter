#> as target


execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0

scoreboard players set $damage isc.tmp 8
function isc:damage/add
